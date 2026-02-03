Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LPAM4ALgmmCOQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 15:51:44 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CEEDAD01
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 15:51:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09E26C0693E;
	Tue,  3 Feb 2026 14:51:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B12DC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 14:51:42 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-481188b7760so38788655e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Feb 2026 06:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770130302; x=1770735102;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gVDbMP2h4x/mUb6G2s8x3K2KoBv6D/1Du/nOa/GGM5s=;
 b=aXh5eSCZD8/WLX2CSyNyiA7Hq2Ppaw7EA9cZ0rKHcF+1/tKtEIVss1eMGIbAkbN3yY
 c8CjFXaf9q9UEot5Q6atY+p4ILOqEINOiN+UZJbpg5vaKdkaqvJq4Pz0goVjf+rFDbME
 mO3nStdX5GiQEFkIuEFagbRgmNvmbdzl8W2jKfvmpRIKMt5MDFl3Jz229ELE05XGoBlx
 nTqQlMVu/WKrumTNrIfJ19kxKp3ae7lT8cHSK6Xi1hZJFgXX6JxwzOAVebTnBziu1rJh
 56fLftb7ODyfGL7mM+GlDU6ZwmlXb6Yn+n2xe09mk/wewwCtCP3E8c+GrL6U9PvjX1ub
 BoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770130302; x=1770735102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gVDbMP2h4x/mUb6G2s8x3K2KoBv6D/1Du/nOa/GGM5s=;
 b=rgav9x/jwwuJi2TyWlClTjal5JbuxftOoXm0g3wZrPlWGVY1L3zelh0oEkm6iHFOh6
 m3EKNm+1iugf2ntN/Cbmwu6Skeq6QvMaBpngfTIj2zj1zCr66i/77urI8Ip5j5HjlQJd
 oXeeYK/uOO6EUpQJULjnMpQm7J+rMDAS08twBbb7Uh3QFUOV2I3J/AGM+bLp5Pz7OpDU
 LGjP236j6TxaV4RT3qPBuFssVjtLe7wboc0m1MCZdogWyspjeafuzVqzWmsxcdLqGLT/
 nIfxhXtVY8dKNGYZobmXNySCC/uo5AxcqOcQzo7RpJ34qGpTk/PtfchW0JQokIx6u6aM
 2wDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJmIvcziI5G1GVTQHibLRnnO7z4bem3ekQ9ktoSooEDRxpEoKiZZ/LgeYVnLPolVr9Lf07fURvxl2PpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy/YmWo1+I2ao9PGQ8njhqyQicC0fWSUBsGOvjMNVFjGHY3HjHg
 ZYLlTQeqsfK7w7/IXaFf0eMGaLXF737Tn0EV4I0Xxdc+o1iVcrMFHX4MoxOMyzfDmJE=
X-Gm-Gg: AZuq6aLw0zGT/6gs342Gi4m23lbcKSwi6qB9x1d4J0AWpHk8YCa56v0kkYwRZ4QcJFA
 SMJzFOMzCmytsDWwcz55zxmV+QtnQletVY0OSKS/SmcKEud7QG9CX03m6DXct7gFemVJvod3YeC
 v5lO1va6M9vrw6W/7D14rRO4WPk6bWgybUj/acMBpP29rDoxvhUXNDzllZTAFOiYbU0a/gK9v3h
 KzaIuzTybj57VNaeC6MS1LB3NE0tM0IE0QDQVIfpxaacBDwKpv2/XDlbunkRLy2zjHrzFjzX+37
 U63/a/bRs439KgemAmqXUvjar0hMRNVidZIk1nfkQrGaDcR7Mg6BXgG/fRLKNBvatmGxdKrdz+d
 JNpCdaTokpFnkcat58SZdnOEWUCnUqdD5Mnl7JfNrI8RjZFqh7VVWKWVt3FRoFgNB2lKDt2cUb5
 qWf2JuxzaXH7NJfePH
X-Received: by 2002:a05:600c:859b:b0:482:df17:bbbc with SMTP id
 5b1f17b1804b1-482df17bd2cmr154388865e9.20.1770130302262; 
 Tue, 03 Feb 2026 06:51:42 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dffd47c2sm121508595e9.0.2026.02.03.06.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 06:51:41 -0800 (PST)
Date: Tue, 3 Feb 2026 17:51:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <aYILejxAJef9F8bn@stanley.mountain>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linaro-s32@linaro.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v6 0/3] s32g: Use a syscon for GPR
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
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:pabeni@redhat.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:Frank.Li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:linaro-s32@linaro.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@pengutronix.de,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,linaro.org,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 75CEEDAD01
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 12:18:54PM +0100, Paolo Abeni wrote:
> On 1/30/26 2:19 PM, Dan Carpenter wrote:
> > 
> > Dan Carpenter (3):
> >   net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
> >   dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
> >   dts: s32g: Add GPR syscon region
> 
> It looks like patch 3/3 depends on 1/3 but it should land in a different
> tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
> probably go via the arm/freescale tree.

Yep.  The driver needs to be updated first before the device tree.
(The new driver is compatible with old device trees, of course).

> 
> We either need explicit ack from freescale maintainers or this should be
> split across subtrees, right?
> 

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
