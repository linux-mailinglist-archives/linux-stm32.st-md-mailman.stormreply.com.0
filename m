Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEIeJZ99eGkFqQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 09:55:59 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7369158C
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 09:55:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB40FC56603;
	Tue, 27 Jan 2026 08:55:58 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C35D1C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 08:55:57 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so45845985e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 00:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769504157; x=1770108957;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J6gcw78eDfCGKXCKZBLgnF/iPeG+D4+74BvG9CfzhIA=;
 b=nL4bNfn5DibYR8RvCiFL2rrBd5bQ3aDX7uTEkGYYvYYwab28w+A+ug47fhPkqJwg5u
 /M6SDcjO1Z30AafD1sY2wJRTWfaaG+41htfPvg/sJLs2KWbfbAkobtor1/paSiGzMxCj
 /pDFlGSxFhQwe1HiEwqUHWVtGPFvk7uGmOjWh1U2gmOb/KPUOhpOwmfcHggE0+tiZMk4
 xmrgdq/8cEGTs2rvKJBXcvBTztSdVv4Vw10SgF5mHduupGIiCPF9F/nPhn+fuqKPHbtS
 IYZchdvPSEoGqZ9iaUdS3D8wWkDqRSGOZzWhzLD/GCqwsUIKJSP+6zeg8PxeBK0lmper
 ykaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769504157; x=1770108957;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6gcw78eDfCGKXCKZBLgnF/iPeG+D4+74BvG9CfzhIA=;
 b=QsHne09aBUQBUXpkJCm6UCpTJqvg/XOB2MHrobPWrU9gI5yTy5c54mcYVSPDgswNtZ
 efccG8ddv4bTMgOmcOcc8FvvWVIsFOZktPrmaYFjtY2FUetExf5JGhzO5+vEhdR3n2xR
 hTskFchkLgvUPWqVzF5fDcIQXzB3U84s+SwKZrG/E5egP71ybTxT0p55SFM5xh9lZd7o
 9SvHTbRqiGS9VaQPdAWUd91zp7WxCydGDv+9qQUp6RxhFGlmlNMSsRsNr9qTukQF/dGp
 OwUKawPYRgyKTbMnJh/sfUSASYkS3A8k3K7Xev6QgwwaN5ZiQNCwl0I9z/zv/R8uX+Wz
 NBSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/MxhrztM102hGqbgVsA71+gEsQ9hp4q6+X0vvbYKaUSQEykTgsHkZF4ee1MGPq+0tBQ/9klLFdJymMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxCr2Hrd9h6JoIqzwd4Bgavo4dxhsCyL803jqVRtIlRlgXXVN+W
 5OIIffnSIfm1dxFDW+lQ/yAuo71GFNDHKAnE20O7qdhTavil9Vx2LPUVf6jC/F19Pd0=
X-Gm-Gg: AZuq6aK3D+lycAi9AUB57K8/3CG6oDDep0X8vvXyx8ithAV1aXPP8d6cCBkyDLbaSiP
 kSJ7dibT/SmoxvfBb7uUSqn3dT7x/FV/ccOHQIvyq5hqZeSfRcoVP1yzggUCgh7T2TsEJ5u4fK+
 uVJxUgIrx0YBNgR7BvTfSuoKlcXJAXM8MASJkW7+wQ9+T80jr9RGWq71pyC6FrydhyQrH9vOKCE
 T4S55/oMl6ZEnikPSJUh7AIcu/Xxc0yYUTUdY0sWXuQbJRcDGADs0n9OvAM92wvLiDiNhb4/UXv
 XS+YKASLaG7RJei2dwZkwXtgqnI8yIBuvq69xPqTCPnjTGKWSk91gHUK7c6BFBZWXG41+Hl4hMn
 JfFWIqjBipatOEloKdsHEz7QHqlBGRHGU5qzN0eY6VZom7h/Ls3Rscg7HOcRSgD/Sa4StJRtYNX
 K0kB6AkTmlfP8KS2k=
X-Received: by 2002:a05:600c:33a6:b0:47d:52ef:c572 with SMTP id
 5b1f17b1804b1-48069e0fd24mr6300105e9.1.1769504156658; 
 Tue, 27 Jan 2026 00:55:56 -0800 (PST)
Received: from localhost ([41.210.143.248]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm50695725e9.14.2026.01.27.00.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 00:55:56 -0800 (PST)
Date: Tue, 27 Jan 2026 11:55:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Message-ID: <aXh9lcfw6D6KouI_@stanley.mountain>
References: <8f2139e8adf02b485a4c84d558fc23f78cf04add.1769195864.git.dan.carpenter@linaro.org>
 <20260126152430.1390514-1-horms@kernel.org>
 <aXeJYo-0iiNuXVGH@shell.armlinux.org.uk>
 <aXeP1y7cK0XRx3Wo@horms.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXeP1y7cK0XRx3Wo@horms.kernel.org>
Cc: imx@lists.linux.dev, s32@nxp.com, Frank.li@nxp.com, edumazet@google.com,
 ghennadi.procopciuc@oss.nxp.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>, kuba@kernel.org,
 pabeni@redhat.com, linaro-s32@linaro.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, kernel@pengutronix.de, s.hauer@pengutronix.de,
 jan.petrous@oss.nxp.com, linux-arm-kernel@lists.infradead.org,
 chester62515@gmail.com, mbrugger@suse.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, shawnguo@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [v4,
 1/3] net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:horms@kernel.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:Frank.li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:linux@armlinux.org.uk,m:kuba@kernel.org,m:pabeni@redhat.com,m:linaro-s32@linaro.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@pengutronix.de,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,armlinux.org.uk,redhat.com,linaro.org,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 2C7369158C
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 04:01:27PM +0000, Simon Horman wrote:
> But at any rate, I think the key question is should the case
> where regmap_write() returns an error be handled in
> s32_gmac_write_phy_intf_select() (by some means)?

Generally if register read/writes fail then there is nothing you
can do a the software level, you need to buy a new computer.  However,
in this case we may eventually put the registers behind an SCMI
interface so probably checking is a good idea.

Could I leave the error message out?  The callers has an error
message and if you ever see the error message, and even with SCMI,
the fix is probably still to buy a new computer.

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
