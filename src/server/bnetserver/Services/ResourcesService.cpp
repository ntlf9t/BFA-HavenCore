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

#include "ResourcesService.h"
#include "BattlenetRpcErrorCodes.h"
#include "Session.h"

Battlenet::Services::Resources::Resources(Session* session) : ResourcesService(session)
{
}

uint32 Battlenet::Services::Resources::HandleGetContentHandle(::bgs::protocol::resources::v1::ContentHandleRequest const* /*request*/, ::bgs::protocol::ContentHandle* /*response*/, std::function<void(ServiceBase*, uint32, ::google::protobuf::Message const*)>& /*continuation*/)
{
    return ERROR_OK;
}
