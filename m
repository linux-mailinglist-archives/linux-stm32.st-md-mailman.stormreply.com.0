Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92936A9718F
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 17:49:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20A94C78034;
	Tue, 22 Apr 2025 15:49:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 162FFC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 15:49:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 645A943B46;
 Tue, 22 Apr 2025 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745336979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jh3TOfjfjJtUvON3fbrchsnqfDrRlyCdWG8ags+8rQM=;
 b=Gr4x62qVWVJAZOqxoX06AnZysciGvSzFdSjOhSqxWDVbTqMV3wEPeM8pJOQb/10fNgs+si
 0W7YhwBA4ilB5Sf0PRqfH9opH8lhnhU6wWYmn2qhGX/6tF0cGySV0BVYC4CVSULmXeiU6X
 gIDGrw3ckqcCGZdlz08ChE5MRZkKGI3mpziwQvDZaQuXOl1fzQ3i/Yb1OVSlRxMxuvb9sp
 vyQAyeSpZHSeJ7SndnFO7nQ06vCF3H+Xe3NSRPvmSE35nq1G3gtbQnEcWMdBAjmFOf8zUl
 31ad9KcVgBAAppNYiHbTaJxPx48CMed1UcF9jPVYLKVvPQiE4rcXJublK+/SUA==
Date: Tue, 22 Apr 2025 17:49:34 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexis Lothore <alexis.lothore@bootlin.com>
Message-ID: <20250422174934.309a1309@fedora.home>
In-Reply-To: <20250422-stmmac_ts-v1-1-b59c9f406041@bootlin.com>
References: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
 <20250422-stmmac_ts-v1-1-b59c9f406041@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghml
 hhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: linux-kernel@vger.kernel.org, Daniel Machon <daniel.machon@microchip.com>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/2] net: stmmac: fix dwmac1000 ptp
 timestamp status offset
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

Hi Alexis,

On Tue, 22 Apr 2025 17:07:22 +0200
Alexis Lothore <alexis.lothore@bootlin.com> wrote:

> When a PTP interrupt occurs, the driver accesses the wrong offset to
> learn about the number of available snapshots in the FIFO for dwmac1000:
> it should be accessing bits 29..25, while it is currently reading bits
> 19..16 (those are bits about the auxiliary triggers which have generated
> the timestamps). As a consequence, it does not compute correctly the
> number of available snapshots, and so possibly do not generate the
> corresponding clock events if the bogus value ends up being 0.
> 
> Fix clock events generation by reading the correct bits in the timestamp
> register for dwmac1000.
> 
> Fixes: 19b93bbb20eb ("net: stmmac: Introduce dwmac1000 timestamping operations")

Looks like the commit hash is wrong, should be :

477c3e1f6363 ("net: stmmac: Introduce dwmac1000 timestamping operations")

Other than that I agree with the change, these offset are the right
ones, thanks...

With the Fixes tag fixed,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
