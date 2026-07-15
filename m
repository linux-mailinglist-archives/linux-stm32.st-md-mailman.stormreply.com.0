Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o83VHxonV2phGAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 08:22:18 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C0775AEF1
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 08:22:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amarulasolutions.com header.s=google header.b=gX8ueEA1;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amarulasolutions.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3096EC58D7B;
	Wed, 15 Jul 2026 06:22:18 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE8FDC57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 06:22:16 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-697564cb69eso151913a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2026 23:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784096536; x=1784701336;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
 b=gX8ueEA1dgABUXN29kSlVzSSBL8+qUtLyTwG+uv8MEgSGEDroCuWZT8l3xkaWwYkj+
 CWsgcamv8gNzplw5o5v3kDtX0qc4GDu8pHqzMh6YIyLDKlUMnps9OWs36h/txoFGM7ck
 6EHc6HT8DiBF7WjLxnsuXTsntOW2K/jF/RDRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784096536; x=1784701336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
 b=C7j02Sq+tVdAqXKX27MrHtZAzA+wC15dM//9KgllHw4vhM4bQsXUehBxmfPgUDKRmh
 Zktx8AUZCqeU5oQNu4ZD5vvnLuFDwyLIWZp9w3vganoKl+7touJ0WNj8yoq8YpCZ1/lu
 5mnc/vnW0u9cn4K1eJn62DKuOPZF6TE4Ot9fcyK0UNaTQZbvGJ5ZrUcNpUTnPRLAvzAH
 fRTeuxTsPiVqDHrP5sxioPVpWcVy1YTTvQRc3smRv1n1UWZkB1Z3GXFMbMbSTR8bf0yb
 mrwsTT4t3Max3TGeAohPeWco2XWfg/cDygg9x8VSwdMdyJCHJWiV6/NFGUENadXRyM9g
 PLAw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqJNSVRJuhA5VnCBlVSa+crNCzgWRQxgMUOk5G/UVd+PFSNVf/mK/FdXXq7g74u8iNZGJ2hsyEpgtZnqw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwgBRPgpgg3eKFgjF+i2AFmtT1jUmQ2H1LUfCp2hKhEuArTYK5X
 nk+FW5IzzuSLmf+sLTX3K06GDwKZCyx8fvE2Vgx6RwI+Vw22i852fNUzbUXFlmzIi3E=
X-Gm-Gg: AfdE7ck0U9fee2DkHdSOMNRg2Z74GWTlTHmHW9bdTiTnkFPJvReJ5JO7oRvVlcy5qGN
 V3LMOrhacV/LYYbKDmKjE4i/7e8203JY0e/JTm2paj2BCdBf8UbrS4nWb2dVIO+J2zzDSC5j3vK
 +bOE40FC9ujX16ny4cFJPaBflzbotj++gboAoJ9z8K/JrYxSYZobjRvT4iEHZ1QNeXj9c8skRnq
 Szgk4bz13LF63DUVoBl86BkDUF5oKzkalnn9GNY4g53LZpIosAi/vdEeN72p4REeVkXV8eVYexK
 aI7FguGaBq0kSFRBQiihv89ZNg2QWTAAirT9hR5JCz64wrruR7/LSB6jncVT40zzM3JwjPN/zZY
 iT0aqcIutWnfzywcQg2voZe9GgVT8Zzm6Ws/zCforPEXGVfHnW8hORGIQHMYmAqWf+eDc32xjlI
 ygVHY1fIhSphDZHAbf9Zw7N7ax386mt2msAtapZxeaPLQJSX7mYI0J/GBPeiXJskzOd9sWcdmo8
 4Bo9vBHJEEb
X-Received: by 2002:a17:907:8b99:b0:c16:3187:997c with SMTP id
 a640c23a62f3a-c163187a0e0mr757455766b.1.1784096536252; 
 Tue, 14 Jul 2026 23:22:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 23:22:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 08:20:19 +0200
Message-ID: <20260715062201.3599458-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, francesco.utel@engicam.com,
 domenico.acri@engicam.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v7 02/16] arm64: dts: st: add
	power-domains to sdmmc1 on stm32mp231
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:dario.binacchi@amarulasolutions.com,m:devicetree@vger.kernel.org,m:francesco.utel@engicam.com,m:domenico.acri@engicam.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,amarulasolutions.com,vger.kernel.org,engicam.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:from_mime,amarulasolutions.com:email,amarulasolutions.com:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:email,stormreply.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63C0775AEF1

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
