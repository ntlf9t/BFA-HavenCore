/*
 * 2026 BFA-HavenCore
 *
 * This file is free software; as a special exception the author gives
 * unlimited permission to copy and/or distribute it, with or without
 * modifications, as long as this notice is preserved.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
 * implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 */

#ifndef ResourcesService_h__
#define ResourcesService_h__

#include "Common.h"
#include "Service.h"
#include "resource_service.pb.h"

namespace Battlenet
{
    class Session;

    namespace Services
    {
        class Resources : public Service<resources::v1::ResourcesService>
        {
            typedef Service<resources::v1::ResourcesService> ResourcesService;

        public:
            Resources(Session* session);

            uint32 HandleGetContentHandle(::bgs::protocol::resources::v1::ContentHandleRequest const* request, ::bgs::protocol::ContentHandle* response, std::function<void(ServiceBase*, uint32, ::google::protobuf::Message const*)>& continuation) override;
        };
    }
}

#endif // ResourcesService_h__
