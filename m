Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHIsBaOG72n/CAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C074759CC
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A188DC58D7C;
	Mon, 27 Apr 2026 15:54:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 116DBC8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 20:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776801780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3zuspwqjQXluBmm8BYsT+wPUm5BBdmNQ0nxP766NAw4=;
 b=EiKSzfC9qmKIcJQiWh75VI0zIkEmReX54SUt39LBIXmRY9JiQGxaQ0YItHSorOlePEK8MK
 d5uIPM6G6tQyicRKb1TNy2clW7Yk/oALaJKeCoVSjpm5/gGw3BZYaTfBav4VQH9TXDY6aq
 6lu+GIt2JUiYuiRSiD952XfSPJ/LImc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113--Nybrew9N2-c16io5GrO_Q-1; Tue, 21 Apr 2026 16:02:59 -0400
X-MC-Unique: -Nybrew9N2-c16io5GrO_Q-1
X-Mimecast-MFC-AGG-ID: -Nybrew9N2-c16io5GrO_Q_1776801779
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8a275472d89so69585366d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 13:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776801779; x=1777406579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3zuspwqjQXluBmm8BYsT+wPUm5BBdmNQ0nxP766NAw4=;
 b=q179wTp3n3RbHe/dVc7wAw4Z0DkvzYdgl//bkDkSmwuHqs6IxgCpkLMNNpxyNsDvUi
 pTcpVoSbROpUGOKtOpfT5v8OauAdG7dYySFhFzvOtjUzQzqsqYyKzJ4jrOHPo5qt5YJy
 HYC/LHlrJm6yu8dCedm9hpYUKfhWr9iDDGMETFkDCBXld3CHTrea3drIHqoG+5cyLRLF
 7cHj99MauXAIewNdzVOi2MRiM0/wNNGazTLLTwe8AJg1RtMeRKkuyYT9W7fIeZYqx/Um
 jLxOu7uh3WPuQKVP3NhnHlC6Ae+q+unf8/Fasq0RR+cMVrbmg4SrZiOrDpyHOkKUfH+X
 +8HA==
X-Forwarded-Encrypted: i=1;
 AFNElJ924JyAgmn0h8E8k+xytksN1yi2VV9pO7K/noAsE5W4ZdDE6FZuCoGpRpM3Eeg+uFOdWRS43ggjXdsjjw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUXTMAKpaVih4wn4f7bHNEnpXaZqLE3/PdCT1Bp8vyOsTsLb+Y
 jUadR8E0z8eq+lWCcd4kXztHC479vWJF9t/WPZ6Q9YQZk9FSf06av3zpupCLXol/pRqJrxvmNiI
 JS1lOpYox+Di1sfkJfpGw9qzaqqsq1z2evXhzMf7POHQgn8YD993G53L92Xvf97Buqg6on1PLiH
 AAbZYITA==
X-Gm-Gg: AeBDievwyeCUtWlOpatHtDr5cHpenog25vqGIxJZtFG7dwhnKPxjzvfO/pIYsYP8wgQ
 s6R/1429LyZm4BCPveo5b7aPALlJS6WdNO0TXffiFqzxmETWlA66e1HNCOiHJifurdqp4cq0TD1
 RgfoMfA/p2R3eDJLAQhpKIhvUpiJORNJTbfh2Fflvox8YzFjao4DBfXcXUzFkJTUo3tDkx1ZWRH
 C8KRhaqmXNg3fOH50ehvP9NVoW/KjFryzDIR7nqJHE5efDG7M1QFBH+EZhPUIG68Ez5XpnVUfhl
 ypc3RKWdythzjCMCrNPAV/XyX3psyzeGLhyZ6T/LfrXdAgeQpE8ZUYSYFZ3GzPO/7UhGYzc8JnB
 3eFedN3TcQ9E21/rjbeEV1dGKAtDeRL8ruqTya66xbg==
X-Received: by 2002:a05:6214:5b87:b0:8ac:a5a0:481 with SMTP id
 6a1803df08f44-8b028015984mr335683746d6.4.1776801778622; 
 Tue, 21 Apr 2026 13:02:58 -0700 (PDT)
X-Received: by 2002:a05:6214:5b87:b0:8ac:a5a0:481 with SMTP id
 6a1803df08f44-8b028015984mr335682706d6.4.1776801778111; 
 Tue, 21 Apr 2026 13:02:58 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ae5ec2dsm115982646d6.29.2026.04.21.13.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 13:02:57 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:02:52 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Message-ID: <aefX7Ajltzt5EqIR@rh-jkangas-kernel>
References: <20260312-dwmac_multi_irq-v11-0-09621ccb040b@oss.nxp.com>
 <20260312-dwmac_multi_irq-v11-4-09621ccb040b@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260312-dwmac_multi_irq-v11-4-09621ccb040b@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OTeQ1M6IXrIG-8AAFhAGcnz4KO4b6xmQLiOID_mEmZI_1776801779
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
Subject: Re: [Linux-stm32] [PATCH v11 4/4] stmmac: s32: enable support for
	Multi-IRQ mode
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
X-Rspamd-Queue-Id: 64C074759CC
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	DATE_IN_PAST(1.00)[139];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,armlinux.org.uk,lists.infradead.org,suse.com,lunn.ch,altera.com,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:jan.petrous@oss.nxp.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:vladimir.oltean@nxp.com,m:Frank.Li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:kernel@pengutronix.de,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jkangas@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jkangas@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	NEURAL_HAM(-0.00)[-0.368];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Spam: Yes

Hi Jan,

On Thu, Mar 12, 2026 at 09:55:30AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Based on previous changes in platform driver, the vendor
> glue driver can enable Multi-IRQ mode, if needed.
> 
> [...]
> 
> If those prerequisites are met, the driver switches to Multi-IRQ mode,
> using per-queue IRQs for rx/tx data pathr:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected
> 
> Now the driver owns all queues IRQs:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>  29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
>  30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
>  31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
>  32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
>  33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
>  34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
>  35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
>  36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
>  37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
>  38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
>  39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4

I ran this series' changes on an NXP S32G-VNP-RDB3 (dwmac-s32) and
confirmed multichannel TX by doing a basic iperf3 throughput test:

    # dmesg | grep Multi-IRQ
    [   37.463467] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected
    # iperf3 -s
    [connection logs snipped]
    # grep end0 /proc/interrupts | column -t
    29:  0      0  0  0  0  0  0  0  GICv3  89  Level  end0:mac
    30:  968    0  0  0  0  0  0  0  GICv3  90  Level  end0:tx-0
    31:  0      3  0  0  0  0  0  0  GICv3  92  Level  end0:tx-1
    32:  0      0  3  0  0  0  0  0  GICv3  94  Level  end0:tx-2
    33:  0      0  0  3  0  0  0  0  GICv3  96  Level  end0:tx-3
    34:  0      0  0  0  3  0  0  0  GICv3  98  Level  end0:tx-4
    35:  67302  0  0  0  0  0  0  0  GICv3  91  Level  end0:rx-0
    36:  0      0  0  0  0  0  0  0  GICv3  93  Level  end0:rx-1
    37:  0      0  0  0  0  0  0  0  GICv3  95  Level  end0:rx-2
    38:  0      0  0  0  0  0  0  0  GICv3  97  Level  end0:rx-3
    39:  0      0  0  0  0  0  0  0  GICv3  99  Level  end0:rx-4

Also tried out multichannel RX by adding 'snps,route-multi-broad' to
rx-queues-config/queue2 in the devicetree, which showed activity on
the corresponding rx-2 entry:

    # grep end0 /proc/interrupts | column -t
    29:  0   0  0   0  0  0  0  0  GICv3  89  Level  end0:mac
    30:  4   0  0   0  0  0  0  0  GICv3  90  Level  end0:tx-0
    31:  0   1  0   0  0  0  0  0  GICv3  92  Level  end0:tx-1
    32:  0   0  1   0  0  0  0  0  GICv3  94  Level  end0:tx-2
    33:  0   0  0   0  0  0  0  0  GICv3  96  Level  end0:tx-3
    34:  0   0  0   0  1  0  0  0  GICv3  98  Level  end0:tx-4
    35:  68  0  0   0  0  0  0  0  GICv3  91  Level  end0:rx-0
    36:  0   0  0   0  0  0  0  0  GICv3  93  Level  end0:rx-1
    37:  0   0  91  0  0  0  0  0  GICv3  95  Level  end0:rx-2
    38:  0   0  0   0  0  0  0  0  GICv3  97  Level  end0:rx-3
    39:  0   0  0   0  0  0  0  0  GICv3  99  Level  end0:rx-4

I didn't see any regressions with light network usage, and both TX/RX
appear to function as expected.

Tested-by: Jared Kangas <jkangas@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
