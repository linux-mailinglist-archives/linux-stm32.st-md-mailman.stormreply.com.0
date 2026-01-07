Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5234CCFCDB0
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 10:28:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0679AC8F281;
	Wed,  7 Jan 2026 09:28:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B37CC8F27A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 09:28:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CEE57C1EC88;
 Wed,  7 Jan 2026 09:28:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DE3C9606F8;
 Wed,  7 Jan 2026 09:28:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B4985103C86EC; Wed,  7 Jan 2026 10:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767778116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=BEdNlkEF+V3ZVxV9iTH2XUM+56WQ6cgNcIhMWG/iqaQ=;
 b=ewBilwLcIsdlR/rISBOifhW9NG3hWv/rqiNaL1s1Hx/KJBA7QLNO2DBxaa3u+7jRM9tPuJ
 3kkp96dTDeQ4j76e9zUtCvmYBXhW6vxT/R1aBuSWiRK6dIzoooOniOVArr81TuXqrs9sbD
 q6ia7XtQsjgD1b51QhUUfzbPRt65YTk1cDANUKyzIxFBpohKVnKHzyHZH5HvhkqwV7Cnij
 uYLM9Jcm5xIfLh4PF1E4cEEjkx5/933XTa8KjuQlVgyCPQ3IzKFzuQ3hNzW4SZi9K8LFX+
 rYziEn9zmmxehRkVCGMSYfyPF8LQr8VqswYNr4H31tSMbU5lP5z5L7g9kXIFAg==
Message-ID: <4bf4ec53-c972-4009-b827-5083e080f32f@bootlin.com>
Date: Wed, 7 Jan 2026 10:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
 <E1vdDiF-00000002E1d-30rR@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <E1vdDiF-00000002E1d-30rR@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/9] net: stmmac: descs: fix
 buffer 1 off-by-one error
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

Hi Russell,

On 06/01/2026 21:31, Russell King (Oracle) wrote:
> norm_set_tx_desc_len_on_ring() incorrectly tests the buffer length,
> leading to a length of 2048 being squeezed into a bitfield covering
> bits 10:0 - which results in the buffer 1 size being zero.
> 
> If this field is zero, buffer 1 is ignored, and thus is equivalent
> to transmitting a zero length buffer.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Should it be a fix ? I've tried to trigger the bug without success, this
seems to be fairly specific so I'm OK with it going to net-next.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
