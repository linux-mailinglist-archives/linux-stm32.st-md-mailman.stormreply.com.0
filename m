Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9431C108131
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Nov 2019 01:15:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B79D6C36B0B;
	Sun, 24 Nov 2019 00:15:46 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC3A2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Nov 2019 00:15:45 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t3so4804564pgl.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2019 16:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=MlWS2/07rbosC/qFv8QznfdONMvmj2+tW0igi1RVjQw=;
 b=ez1B5uRp4nlPeh7zDZUaqIVVmrQ4cZEVBD5bsp25+yTSzwX0wZswNSbOeXN8t70oOV
 FhG3p9KcCqjRhUWAOhf9cIb4WzBxbNKgGGFTdVHV7T7k9O0I4DmQNzsXLxBV/RYAfKAX
 gK/yPAbsjh2G5dH8n+2uSvTFKA62eoxD3IDcRAAqRD2Jyv6oss8RUpg1qf4z7CulEAma
 kOse1mK1qWQWI+p75R/WmpEQPeJAapr7LevBTLdqssAYGzqAkEZr18I/1jO1vXtTw9yR
 7DZisviaEICwTsNIeLinkfoWU6qMGJi4KwhUeUuXlvVe2D9lF0JNatKeHjQQjdS/U0kC
 tHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=MlWS2/07rbosC/qFv8QznfdONMvmj2+tW0igi1RVjQw=;
 b=FsiS+GCyWI3GPR4VOGpX8gHoNbRxekAb5oIba+ZObh03Z5+XY1LlPcjLhXQnAqH7U6
 C0Dy2gaQwloo7asq8DfcvdEuIrZ+aReENCn+6JsitMPFxcVP3ULIQlgb5pIqLOw+goPH
 I4kHVmVPIeebELQNSMQA1LgcO6QWhs7DVt8Be9i6fcbFOIkcSVWaqWO+wkvJCdiDIumY
 +QYcjvEugXvPN1nPgdxTjAa/TeiNY6dKOOJ+/rO/2PKqtOQHHB0WBe3cJTLlw5A3tEMT
 abP72MPva3gn0Qopc4WZ3TXqGZFFl5J1tDo6SWZGg556tMRUesURZzcpEopa8XdX1Nm1
 lCag==
X-Gm-Message-State: APjAAAUQGjQNd3OasSMxIjf55g8GTvzRy5bEvxzp2LfDdxHwXCq6RwmV
 aLDlyqQmIsn1yVCANxG6PHxVXw==
X-Google-Smtp-Source: APXvYqw7Fx4pGQM8XweJFPGKswwjFyRrs7WCWKH+T4ZIjjDmS8RS/eqxt3iliLVPz19POH3ZRMTHyA==
X-Received: by 2002:aa7:954a:: with SMTP id w10mr3614854pfq.187.1574554544026; 
 Sat, 23 Nov 2019 16:15:44 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id i13sm2782483pfo.39.2019.11.23.16.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2019 16:15:43 -0800 (PST)
Date: Sat, 23 Nov 2019 16:15:38 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Message-ID: <20191123161538.482313ef@cakuba.netronome.com>
In-Reply-To: <E1iXaSM-0004t1-9L@rmk-PC.armlinux.org.uk>
References: <E1iXaSM-0004t1-9L@rmk-PC.armlinux.org.uk>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Felix Fietkau <nbd@openwrt.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [CFT PATCH net-next v2] net: phylink: rename
 mac_link_state() op to mac_pcs_get_state()
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

On Thu, 21 Nov 2019 00:36:22 +0000, Russell King wrote:
> Rename the mac_link_state() method to mac_pcs_get_state() to make it
> clear that it should be returning the MACs PCS current state, which
> is used for inband negotiation rather than just reading back what the
> MAC has been configured for. Update the documentation to explicitly
> mention that this is for inband.
> 
> We drop the return value as well; most of phylink doesn't check the
> return value and it is not clear what it should do on error - instead
> arrange for state->link to be false.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied to net-next now, thank you!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
