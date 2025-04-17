Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF6AA92198
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 17:29:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CB53C78F74;
	Thu, 17 Apr 2025 15:29:55 +0000 (UTC)
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E364FC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 15:29:53 +0000 (UTC)
Message-ID: <8d6c8f72-a8bd-43a8-b1e6-a20cafddf804@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1744903792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkOBPoUk+xFY5ZKRx/7lO+ZCCZvZu8C4v3s/LGW1qvM=;
 b=tINTPSUkz+lDh2u0qbUCc7IvYTHB0jtNBVFJ9GpvC7Xs047gwS9jy1iPUq6aP0+0OMpGTQ
 tDohhgUbbIgxhRG1BUFLBUe7j3DUUn7RwmiDGwOgZZ3tjEdqYt3iISZp4y0PSgaEgSxpjz
 LfFic1XsdEQ7osExW7l1Z8p7PX0VEsU=
Date: Thu, 17 Apr 2025 11:29:38 -0400
MIME-Version: 1.0
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250415193323.2794214-1-sean.anderson@linux.dev>
 <aADzVrN1yb6UOcLh@shell.armlinux.org.uk>
 <13357f38-f27f-45b5-8c6a-9a7aca41156f@linux.dev>
 <aAEdQVd5Wn7EaxXp@shell.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aAEdQVd5Wn7EaxXp@shell.armlinux.org.uk>
X-Migadu-Flow: FLOW_OUT
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, UNGLinuxDriver@microchip.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>,
 linux-doc@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Robert Hancock <robert.hancock@calian.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, upstream@airoha.com,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [net-next PATCH v3 00/11] Add PCS core support
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

On 4/17/25 11:24, Russell King (Oracle) wrote:
> On Thu, Apr 17, 2025 at 10:22:09AM -0400, Sean Anderson wrote:
>> Hi Russell,
>> 
>> On 4/17/25 08:25, Russell King (Oracle) wrote:
>> > On Tue, Apr 15, 2025 at 03:33:12PM -0400, Sean Anderson wrote:
>> >> This series adds support for creating PCSs as devices on a bus with a
>> >> driver (patch 3). As initial users,
>> > 
>> > As per previous, unless I respond (this response not included) then I
>> > haven't had time to look at it - and today is total ratshit so, not
>> > today.
>> 
>> Sorry if I resent this too soon. I had another look at the request for
>> #pcs-cells [1], and determined that a simpler approach would be
>> possible. So I wanted to resend with that change since it would let me
>> drop the fwnode_property_get_reference_optional_args patches.
> 
> Please can you send them as RFC so I don't feel the pressure to say
> something before they get merged (remember, non-RFC patches to netdev
> get queued up in patchwork for merging.)

This series is marked "changes requested" in patchwork, so I don't think
it should get merged automatically. I won't send a v4 until you've had a
chance to review it.

--Sean

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
