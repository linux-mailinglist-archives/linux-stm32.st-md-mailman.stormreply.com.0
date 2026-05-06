Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOVGLeD/+mkbVQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 10:46:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEEF4D80E7
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 10:46:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45A31C8F289;
	Wed,  6 May 2026 08:46:23 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73B13C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 08:46:22 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2b9ea536877so5056095ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2026 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778057181; x=1778661981;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SbqEMIRZJlHc6JKkwETPU4424MlqTlraWGTdcFOX+ew=;
 b=LcU4SL1AKVTu22RSbjcsRvevgfYavU12uqOdlkb0I7QHQz2f3OZ2Lv2aSSm9+nrkhA
 P+doZ5NgYLKvr9zhoshykp1s+IUXmb/lEePrD1CIIEHADxCLaNAlSurWIMaFo1zFIvw5
 MaYDstJ8ZJZWnpmvlSrXdN/3PGPNCaOwChcw5XQmwuAtPJcBQv8P9cP4fTUV536zK3gT
 8SxIiH+t31reqmYch8Sj8ishud+00YUovQbYxu1NUlwZP4Rwbg6liAs0Nm4ezx5y8AKC
 M9g3qJF7//AlSwP2XJoaQ3kP2GPPRihHTZ9tmWNegoWCQ/nqSjAhUpApd8JBL3e7Cum3
 TcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778057181; x=1778661981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SbqEMIRZJlHc6JKkwETPU4424MlqTlraWGTdcFOX+ew=;
 b=I8ZDAXggN3w6okC5poZYpb8zYy84MOauWmxo4Wz5lixJj4H922lBLen0l0FmDgvkAJ
 fXDvaEERod1bL4DkujP7PN+yY9QZhi037yd4BIs7hmqLtF+46MUfFV/5jtK9MHPH90Mg
 j7iACs0lTSaNKP4BLM12MPgItNydppuRk2Ki7Gi24HmdzwqMBXtGqKYX9VATgEnwlDrr
 V37hoqfx9XR9zLDDunraiZZY0EKKi56NeaTJqicUUrOfb8N2/YDgWeqNn9qi5G/Gztvg
 NUmcfca8PQLCkXA6r18lGNoWZ7oSQD4mWyMskZSON4mJTd1qE6n3JlC+6CpZmcZCQ0Im
 slPg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8akwXg7DVElPMonHnOzQwrg9ujvhUh0kSZllNCUQ0+Ez9fLvwV9UAYOd9hT6wFthT8AQJI0Mbtlg032g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/4hwd163iqAG2+uimoMtZiptWrBhZBoFCU8Y3meikgOUr/Q5p
 lkloIeyphh+5jgqKkbdlzu0bVVzT1D5f0wQLA1dSGaLTI67Z//XxJwip
X-Gm-Gg: AeBDieuBlOV1V5dJ/dGq45qICg5DyQNxtcuSTcTnBrldHS0c0KTvNgmB/twB5F4lNAL
 IMvL0Bup+5SJvdnE1OBmuDjsaKG9GFfClZjftcgdEwAkIljca9yrwkOvwjMNIhFhiF0VNgE5qHz
 N2WAtIsFyWun0of28ZKxR+cR+emuT57DOjLx4DPTo9OAqbBbtBUwOSYCi5MHVlOyyf6n4p9dZ4u
 W42gRVoxXE9bVqDbGP2k7tn85jCxNRuGWxSBAzEMCMSgW3e6mItV9VddKZ9Efs5OvKveN2jHLaV
 YIenObqrmgM7x1+vF2UDjFiEbOGxfe43gZA55h5KxO2kjjBjyzILYnp4Y62evge244ZUrOB+lGi
 /wvnSmMbmqjqme+6B7XoDS63qeDpxI+kLcRS0VU4u3swYXTyCpfmfLScvWlR4CQM5UFgTPq5kNW
 CoNxn/UpGfnSpQD0O02QgpsmXqhb1vMVLw7wTVhOjN7lN8TRvChA8gLHUbXV0nEDKl1vFKSy8ZY
 ERx98ZFlhf4zcas+rjpV9I=
X-Received: by 2002:a17:902:c949:b0:2ba:1c2b:4d9d with SMTP id
 d9443c01a7336-2ba7908a658mr19665375ad.17.1778057180790; 
 Wed, 06 May 2026 01:46:20 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ba7bf2d72dsm18985145ad.25.2026.05.06.01.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 01:46:20 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com
Date: Wed,  6 May 2026 16:46:12 +0800
Message-ID: <20260506084614.192894-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Joey Lu <a0987203069@gmail.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/1] net: stmmac: dwmac-nuvoton: fix NULL
	pointer dereference in nvt_set_phy_intf_sel()
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
X-Rspamd-Queue-Id: 0EEEF4D80E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:a0987203069@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.885];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]

This series fixes a NULL pointer dereference bug introduced in the
initial dwmac-nuvoton glue driver. The struct nvt_priv_data::dev field
was never initialized after devm_kzalloc(), leaving it NULL. When
phylink later calls nvt_set_phy_intf_sel() for interface selection,
the callback dereferences priv->dev via nvt_gmac_get_delay(), triggering
a NULL pointer dereference.

Joey Lu (1):
  net: stmmac: dwmac-nuvoton: fix NULL pointer dereference in
    nvt_set_phy_intf_sel()

 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
