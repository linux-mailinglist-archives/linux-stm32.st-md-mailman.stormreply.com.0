Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHaJHaOG72kBCQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8684759E4
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4FFCC5A4C0;
	Mon, 27 Apr 2026 15:54:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F44EC8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 20:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776802041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1M8Wy22x3elv2D/+fnXEPtAuCSkz1UNFVYr+3jYCUkE=;
 b=Bzp67evSAFNdGjXCnc0ONJvN8s/pt0NBfXJOXMFKxJ7jBKHVddINxCeo/GYccIcpkz6NZR
 4WX25r+wTcdd6qWCSqMUTZvnKAYoDk5HwqBiZrgw2BuS2C6ZeeGmdGOMi+fz+/6tXrN7fW
 lezp2YQ/Lpt8Ju08GgmEzGnm97bFHD8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-HURAj5KqPNWRfZP9uqr6bA-1; Tue, 21 Apr 2026 16:07:19 -0400
X-MC-Unique: HURAj5KqPNWRfZP9uqr6bA-1
X-Mimecast-MFC-AGG-ID: HURAj5KqPNWRfZP9uqr6bA_1776802039
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8a1accb970fso18676796d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 13:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776802039; x=1777406839;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1M8Wy22x3elv2D/+fnXEPtAuCSkz1UNFVYr+3jYCUkE=;
 b=dlOUOzkNdsiJi4uRBs7GziT0oAwhEVbIjAtMWJp0vo7YhOeY7+vOcw6nOzL22zzDt5
 1klhn8KQ3u+uSrxfQiT0R4PzYmGtp/T5probwC94CZXJU7uaZqGxUDuiyhSTmvbksAgs
 IU0iHLRdw5SgE9SE6E6ryFnNdcje8Vq7DeC/XOchNXoGFCflEZxsAbqa+89r3wLJFXY1
 3rv6NYPGz95wNcKFzWFc3t+QzF3qy+WyxC8Sv28pofZTBqKCyF2APJsUbPXck9eI5kko
 L7jSYC/4pkkMVhAFwHUF8gGOdf+7lR8nAQZOMyI4ajzekYfY16eruZIuCnHx32H55nxw
 Eq7g==
X-Forwarded-Encrypted: i=1;
 AFNElJ89hAzAFHKzZ759F+zny2+Usw8eW3Z+dc5i7PD5tVcTrpN/+ZEiUl85ZpBzeBbTrTAstHRN0XflWLjIZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNO/fccoQAc2TDAkPEeOXyNeTokjyzfPNNyi44YpCAgPU7WrqN
 nBZcjCNmYzu7I0polyRSPmvfUOE6LVkelZiDhmiYZ2spsinXUkVeYyqnurTqQ+4iAuPIpZOA4kN
 iu89qC2dyQtLkPj7aq6CNzw/DshdXvmVq3TWV04UCGOn1hPGuvUHwQZ0hVUQI25N/hKIypkNhLb
 43IgvUyA==
X-Gm-Gg: AeBDieu7WvBqq4kutH9kxmwYn3WvmhXHnarlrd0/ZfasMg4dhmG5TMR3Y1ppldsi7Bt
 AWVMvhHh+fihnuJBWA+cZlLi+gGTRC/TeW7DjTEszY6qdJz8jA3WOVZ7HgjjmwdAJQTPNk1rVpB
 ukAkUIAb59FNw7HZ9jOdZZmSbLK8kVH0PbUcE+fAznkn+hQ0HE9Bgs8SJ+vxW8G1BVqmHktaMdC
 6Hf/lfnyvlpYfCEPrf3afZzPzpQx3fLUtWJ9mBF+JVSpuzPr+B3vl+i4fis5KoWv6N17TLJeWey
 SUA1n1c7WX6z/eK8qerJfavatZ1h7LyAIJX3rgWdgFHwiy7V+EVPBPUGXgJV705RReS9PtTrGQ1
 v7ahY2nitaAkHvsEGRkXEgymTj0rNb7+xByEreCsc8w==
X-Received: by 2002:a05:6214:300c:b0:8a4:5cfe:a204 with SMTP id
 6a1803df08f44-8b0280d0e78mr313218186d6.26.1776802038997; 
 Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
X-Received: by 2002:a05:6214:300c:b0:8a4:5cfe:a204 with SMTP id
 6a1803df08f44-8b0280d0e78mr313217376d6.26.1776802038427; 
 Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ae5c4b9sm149503046d6.28.2026.04.21.13.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:07:13 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Message-ID: <aefY8WGCuNr4BQG4@rh-jkangas-kernel>
References: <20260312-dwmac_multi_irq-v11-0-09621ccb040b@oss.nxp.com>
 <20260312-dwmac_multi_irq-v11-2-09621ccb040b@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260312-dwmac_multi_irq-v11-2-09621ccb040b@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rpsPrfYgEim6Inm6odbpy3kAu63oJkMa4BZpbzIHfEo_1776802039
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 vladimir.oltean@nxp.com, Frank Li <Frank.Li@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 boon.khai.ng@altera.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v11 2/4] arm64: dts: s32: set Ethernet
	channel irqs
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
X-Rspamd-Queue-Id: 3D8684759E4
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[139];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,armlinux.org.uk,lists.infradead.org,suse.com,lunn.ch,altera.com,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:jan.petrous@oss.nxp.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:vladimir.oltean@nxp.com,m:Frank.Li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:kernel@pengutronix.de,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[jkangas@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jkangas@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	NEURAL_HAM(-0.00)[-0.460];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,stormreply.com:url,stormreply.com:email,suse.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Spam: Yes

On Thu, Mar 12, 2026 at 09:55:28AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The GMAC Ethernet controller found on S32G2/S32G3 and S32R45
> contains up to 5 RX and 5 TX channels.
> It can operate in two interrupt modes:
> 
>   1) Sharing IRQ mode: only MAC IRQ line is used
>      for all channels.
> 
>   2) Multiple IRQ mode: every channel uses two IRQ lines,
>      one for RX and second for TX.
> 
> Specify all IRQ twins for all channels.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---

Tested the new channels on an S32G-VNP-RDB3 while testing patch 4/4.

Tested-by: Jared Kangas <jkangas@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
