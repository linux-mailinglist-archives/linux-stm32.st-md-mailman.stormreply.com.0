Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK15NrSG72n/CAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DC9475A89
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7402EC7A83E;
	Mon, 27 Apr 2026 15:54:28 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60976C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2026 12:44:05 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-c7971d0d97dso5579843a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2026 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777207444; x=1777812244;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4HsOGoXcMVel5UZKKUbLYS7YRDhsp4Nm+pDK49IhB6w=;
 b=ES0tNwBXc1Hd95EPpq8W2rOQ5SgCQqJz4txvgU9Os/ZcpWI0Cq3L5eqqT9MaLMvcD2
 aViG2NRimb+W1vh9f9MOEGkL/H+HfEJlgT3v4evs10Cz8rC9ljadGpCmQ+YDaWFMxou6
 EwUbNMm2Pogj5A1bMH0SsI72kEvCfb1+vcpV7sHraTrahVdQIUo/xkfO6xxU9algHqZo
 9SuucsnuOY29KkjLZjeBTIHf7MeSZmpYrNcmYQ6CJIiNnnYpKGy2M7eKaRds+lHA/2Xk
 yZwIn6XMIzMINmzg7JuoMzqubKh6FQjJuGxDGkQpzxs59DbB8eWj6jht0oz/8t1gnLuZ
 KEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777207444; x=1777812244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HsOGoXcMVel5UZKKUbLYS7YRDhsp4Nm+pDK49IhB6w=;
 b=cXYtj/tAdGn72JJonSWvAlOxdHhhyW/x//8qdzvn5ZzreGt+sQ/3DPz0iyMjSa2+Jp
 hI9UB/dlEf7z6agSNBNs1VxEnNUX3l6E9TQ9IoqOv0LjI2Bv8iaIFayXhKvrP0RJldQm
 M7rlk1Rt/78ziSdR0M4amck7BY2lHlcNPKdmrHLXiL2cvbfb1GMM6iJdGjtRQQNHivtW
 yWXnWzT3BzF8KgnICihnryAZAI5ooh2ASTvgCpCtF+yiTyHk2Ko8+Jpc1H+obyThhTac
 jUMFMNEu7qRjpKNFcLV0tumd0/61romEmFY653cCof2ThAszhNcq8ZnFf4M+en/fxdHL
 gLug==
X-Forwarded-Encrypted: i=1;
 AFNElJ+NWP46hO7fBOx9mAOsvNmIQNXcaf38OTCvY5zA39fGqTqNYMk+XDN09nMLVhdNqpSqKaP5rXQb8lCF6Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxOr+BtlvF+r8/o6DDNtea0O6BE1Ckz+bZF0qcvYJuXp6mzjD8C
 H+HFxOB18ZOgh1c9RoYqEp5/eL1msVbHHn/8VDPMW5wcnbOB6sRxuY4=
X-Gm-Gg: AeBDietxCl5Ydvhgf/RrWrQq1erEsVvCqmSNnumCmKrdNbDLQKNBUy90e/mNnufnAQ/
 53kVyFdUKvw7cWZzsjO8G885CJ0txoNRqyWZiiUt3SER8qtMbpAAkJFqcIc/asdI4G627wA/L3h
 hf45qC22CncEa36gtJAVgTAjvb2adLoUDZsEnhUimh/79AO4KmtvB6CW1qMXLkbv9HeIeXV+6+i
 tXoOAw4zwBJbko+ijToku8ocKorqyAhzlg/d9Or2FjSlyBLEONDJQvQa3NtINXtotRNvPPNT/d5
 oXi/M1OhINhkxaPMySh9vmnzMbxxZc/LQ0oOLb0QGizAN5WzOyymmWqvzD0+aqK4ALtaAqf0zFG
 j8j9822sn793zzE9HjccWLI4ctjri3YgKeVhAXDNd+EGay5Qr/JBJPv8LmdoJmSvWZfuaNFYc6L
 ezzkPZQYqZqcxcA3ky0FeY11q165R5h1jJOG0E62ei/SM83UC3/0pXSUMd3cgnbpLJSxpQJaqXt
 U7XUArdhTIseKeVh31c5WuTyP//osYXJ/+scHwUcJ9VduM=
X-Received: by 2002:a05:6a20:e211:b0:3a2:ebfc:6bee with SMTP id
 adf61e73a8af0-3a2ebfc7c17mr28544615637.41.1777207443705; 
 Sun, 26 Apr 2026 05:44:03 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7977031729sm23122558a12.25.2026.04.26.05.43.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 26 Apr 2026 05:44:03 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=
 <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 26 Apr 2026 21:43:49 +0900
Message-ID: <20260426124353.38916-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: linux-kernel@vger.kernel.org, Myeonghun Pak <mhun512@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: stm32: dcmi: unregister notifier on
	probe failure
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: B1DC9475A89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[27];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-kernel@vger.kernel.org,m:mhun512@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mhun512@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.870];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,bagmyeonghun-ui-MacBookPro.local:mid]

From: Myeonghun Pak <mhun512@gmail.com>

dcmi_graph_init() registers the async notifier before dcmi_probe() toggles
the reset line. If reset_control_assert() or reset_control_deassert()
fails afterwards, probe returns through err_cleanup and the driver core
will not call dcmi_remove().

Unregister the notifier before cleaning it up on that error path,
matching the successful remove path and the V4L2 async notifier lifetime
rules.

The local history only contains a Linux 7.0 snapshot, so the introducing
commit could not be identified from this worktree and no Fixes tag is
included in this draft.

Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 13762861b7..200b498127 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2063,6 +2063,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_nf_unregister(&dcmi->notifier);
 	v4l2_async_nf_cleanup(&dcmi->notifier);
 err_media_entity_cleanup:
 	media_entity_cleanup(&dcmi->vdev->entity);
-- 
2.47.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
