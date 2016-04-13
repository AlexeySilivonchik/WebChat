package com.saleksei.webchat.dao;

import java.util.List;

import com.saleksei.webchat.model.MediaLink;

public interface MediaLinkDAO {
	public List<MediaLink> getAllMediaLinksByMessageId(int messageId);
	public List<MediaLink> getPreviewMediaLinksByUserId(int userId);
	public MediaLink getMediaLink(int id);
	public void updateMediaLink(MediaLink mediaLink);
	public void deleteMediaLink(MediaLink mediaLink);
}
