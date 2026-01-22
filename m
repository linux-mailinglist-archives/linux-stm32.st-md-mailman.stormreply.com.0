Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDqtK/YLcmksawAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 12:37:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31612661A4
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 12:37:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1F89C58D7C;
	Thu, 22 Jan 2026 11:37:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 315B6C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769081843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0wNs9tyPabqN3sAug4aUnrZjg9O+jb6nYLQLd09yp0k=;
 b=NvVpSFwcVsuZzeXbByWp6S4i32vdSpFJrIB7mcxwInVMTc/a8Gt3ZHAZVfKeRWYO1FNUT9
 yqNPzoKcax7Mmi+rvb9fwZpbZTo88JLCf5yqV0hltrNJbqNBKxVj9YVOQIezep8Hcz6i3n
 bSrsG7T22EuxBRMqkIBahUQBLFmQDOA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-229YzgkJPHCt4PgySY4ijA-1; Thu, 22 Jan 2026 06:37:21 -0500
X-MC-Unique: 229YzgkJPHCt4PgySY4ijA-1
X-Mimecast-MFC-AGG-ID: 229YzgkJPHCt4PgySY4ijA_1769081841
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47edf8ba319so7032655e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 03:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769081840; x=1769686640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0wNs9tyPabqN3sAug4aUnrZjg9O+jb6nYLQLd09yp0k=;
 b=c2uXJIawui4nqcUhZdty96bJRizFyP6zDNY2Y/Xx8rdgj/YN2OwE9kQXlGz5u2PcKX
 lceN2ROCzALr3qtEfu0TIikG3GFuNrhWvPSE+jtwysyTbt6IzKie57cc2rYDm/0MbNo5
 tm1P4P4/DxVeEu3b7c41UGQ9Y5ZJNqNDlrK60k0S3OWY296b4VdUEfRPTEFmCxxM0nf/
 ZCwfoxfyrhgmmPcNAp0YYzmUmHT73Rx5WUuyiKonjPVr5KfQ4QFf9jNHA6h90jCtEOn0
 N9MFuyBCdrgw3fTIVKwKu22ZPQ8Ccny1MUGhaYbUxJ2HD2VvhopdIg4lcbf5lrS387j+
 nxPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2YRh8V1e7u7jJwDg1SQM78nVQjrIb1kWNW3/MNbCZFQRCQ+LPd8zq9NUc9PijLGHqHxtZeypu+Lr1wQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy45o9xltpGtyAggMyI5DlKYGt3galHZv3KRNKnfKgZk4eHk+R1
 x9ucwiuULM/2OwZ8WXjQiRdPPnEbC0QLAoGOA8xTVS9yE3obGUQRld0hotApD6lwKlqg9ZCV7ZG
 vTN/J6Bi+duxuVKyLS77oh20OWxNDt9Le98ajEjMO71vB8BIaAYlchdlW6JVAhl0k+amYxFcBHq
 8yQ7805w==
X-Gm-Gg: AZuq6aLhk2SLzUT3AY5MU67rPKP99GjwTbhfjEGMRuY1ihx5I9raQ0CX+XVN1W7aJng
 bVanJGcUfIBwz5SgVnduBfr6839jo675rtJTSWWrwQ/6faITW+5EoIUdwdHh4587W5HeG0hi0DE
 os16zulyYKNXexqEh74jA4jYw4r2guvPLUn0OwuC3b73wTz7Jz0xrMbi1OuKgR6MhyjfZXbpx4J
 i0WUZ+6V9cmDGbPuK5qqIGkpx3dI/RJVhMFBIE2XeEkPeEUupWJeagc7MeyrBIg4vOwlxaYI372
 1AbN/K8XG6WRwPRlIj4w4u4ReKpcNF+U4XaPTyw6MytHkrpaT+FECa/nhARCNn71aw9BAHPKDg+
 SLtt0P0iRfmot
X-Received: by 2002:a05:600c:34d3:b0:479:1348:c614 with SMTP id
 5b1f17b1804b1-4803e7f03fdmr128686905e9.26.1769081840540; 
 Thu, 22 Jan 2026 03:37:20 -0800 (PST)
X-Received: by 2002:a05:600c:34d3:b0:479:1348:c614 with SMTP id
 5b1f17b1804b1-4803e7f03fdmr128686445e9.26.1769081840134; 
 Thu, 22 Jan 2026 03:37:20 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480424b18cesm51351875e9.4.2026.01.22.03.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 03:37:19 -0800 (PST)
Message-ID: <86b8feca-8e82-465e-a17a-b751758306ce@redhat.com>
Date: Thu, 22 Jan 2026 12:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com,
 francesco.dolcini@toradex.com
References: <20260120203905.23805-1-eichest@gmail.com>
 <20260120203905.23805-2-eichest@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260120203905.23805-2-eichest@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _MRkcGbN_qtwQ66cwJb-ckSPrSXcvQ0_O40hJML4p_s_1769081841
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] net: phy: add a new
 phy_device flag to keep preamble before sfd
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eichest@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:francesco.dolcini@toradex.com,m:netdev@vger.kernel.org,m:stefan.eichenberger@toradex.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,foss.st.com,pengutronix.de,armlinux.org.uk,st-md-mailman.stormreply.com,bootlin.com,toradex.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,toradex.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 31612661A4
X-Rspamd-Action: no action

On 1/20/26 9:30 PM, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a new flag, PHY_F_KEEP_PREAMBLE_BEFORE_SFD, to indicate that the PHY
> shall not remove the preamble before the SFD if it supports it. MACs
> that do not support receiving frames without a preamble can set this
> flag.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

I understand this has been suggested by Russell, and LGTM, but still it
would be nice explicit ack from the phy lib crew to ensure it matches
expectations.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
