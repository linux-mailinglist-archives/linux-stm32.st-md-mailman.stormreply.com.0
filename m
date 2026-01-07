Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60885CFCA5D
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 09:42:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2290CC8F281;
	Wed,  7 Jan 2026 08:42:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06FB0C8F27A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 08:42:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1BCBF1A26D7;
 Wed,  7 Jan 2026 08:42:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E323A606F8;
 Wed,  7 Jan 2026 08:42:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A9889103C84BF; Wed,  7 Jan 2026 09:41:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767775320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=S6R5YZXnAQ2jLJpBkyeX/V5VN7/gW0xtPNeUE+gg5Fs=;
 b=zuEF6uCZEW7MAHhZSfYimtePz4dneRVkvsfmd0IFWnS95yRuVQsF9TBXvExxudranQSWB0
 SEkKGmgO6eJIuzbaMi7rV2Bgj/T539Lq0xtJvJt3inSLgNdG/vmh9fb6z2MIgIVQ8YG0um
 wbs1nXmajdpv8IGBU+ehdoe933Tei5wVDoYE8HOesWiJIgx5yszMDQkZ5TVfx5bOShcDMI
 Ad+LaOiIgVvuEC3oP4YDclRNs26m4kVsPb2HREsmVyLc9inzlc7c4DbAFOh4o+mXthR07g
 Kp2VsNImixkFYhhdmICTMZ6Nzfqqxnup8SZiu5NnpQ57KFLXGOo/4VN9ufdKfw==
Message-ID: <0b5a9cb4-3d35-4650-b482-29b3c780ed1a@bootlin.com>
Date: Wed, 7 Jan 2026 09:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
 <E1vdDiA-00000002E1W-2X6U@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vdDiA-00000002E1W-2X6U@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/9] net: stmmac: dwmac4: fix PTP
 message type field extraction
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



On 06/01/2026 21:31, Russell King (Oracle) wrote:
> In dwmac4_wrback_get_rx_status(), the code extracts the PTP message
> type from receive descriptor 1 using the dwmac enhanced descriptor
> definitions:
> 
> 	message_type = (rdes1 & ERDES4_MSG_TYPE_MASK) >> 8;
> 
> This is defined as:
> 
>  #define ERDES4_MSG_TYPE_MASK            GENMASK(11, 8)
> 
> The correct definition is RDES1_PTP_MSG_TYPE_MASK, which is also
> defined as:
> 
>  #define RDES1_PTP_MSG_TYPE_MASK         GENMASK(11, 8)
> 
> Use the correct definition, converting to use FIELD_GET() to extract
> it without needing an open-coded shift right that is dependent on the
> mask definition.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
