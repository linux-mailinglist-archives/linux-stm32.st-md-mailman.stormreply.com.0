Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9775A4CDB3
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Mar 2025 22:53:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AC72C78F63;
	Mon,  3 Mar 2025 21:53:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EE1CC78F61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Mar 2025 21:53:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B05120457;
 Mon,  3 Mar 2025 21:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741038791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xBOb7oGeYLEpXfq67SR7gONs2pzCSxu5VZhQZhEOe6c=;
 b=mCLyG6hBbbcmuyXpIbTsjYLroVo6Y073oLGc5iIpWunCG6SjJWBZ/AJoHMoWREdxC7S6Nk
 6GgGL/bUWpapqJdoccETbQhHWoy+6n7m1GncwhDEOdRrGasYG2WJe+4qvDbZHSfBctKoaR
 IsWpDs1zNJ66dPivtbwU9WO3bSShsk/t5nRXE+CxdN9MoZV2QXkJeHgCLP+0Y+5E89lNPN
 x7xpc6f0aQ5rlxWQkCn2x6oiITMkS1lzaWEcE6pA3lu1ceCWUEt6hzI3Igt6Ztrj/m386X
 L/bbEVEfh0VlN/Xzm4HV8DwbUkQ3aAwT8WvoX4t9X2Jf6TUfTDE+78Ek8ul8Pg==
Date: Mon, 3 Mar 2025 22:53:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Message-ID: <174103876909.1106916.958645902819103595.b4-ty@bootlin.com>
References: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepjeejrdduhedtrddvgeeirddvudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrdduhedtrddvgeeirddvudehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpt
 hhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepuggrihhrvgdrmhgtnhgrmhgrrhgrsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepphgvnhhgrdhfrghnsehoshhsrdhngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/7] rtc: Use devm_pm_set_wake_irq to
	simplify code
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

On Wed, 05 Feb 2025 08:58:18 +0800, Peng Fan (OSS) wrote:
> This is a pick-up of patch 6-12 from patchset [1]
> 
> Since devm_pm_set_wake_irq is in 6.14, so resend the rtc parts.
> 
> R-b tags from Linus Walleij and Antonio Borneo are still kept.
> 
> [1] https://lore.kernel.org/all/CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com/#r
> 
> [...]

Applied, thanks!

[1/7] rtc: stm32: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/04572d18921d
[2/7] rtc: nxp-bbnsm: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/6b296dee3eb7
[3/7] rtc: ds1343: Use devm_pm_set_wake_irq
      https://git.kernel.org/abelloni/c/5ad218f101e4
[4/7] rtc: pm8xxx: Use devm_pm_set_wake_irq
      https://git.kernel.org/abelloni/c/e8a0b6e62429
[5/7] rtc: ab8500: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/ca36c9301117
[6/7] rtc: mpfs: Use devm_pm_set_wake_irq
      https://git.kernel.org/abelloni/c/d8690ce183bb
[7/7] rtc: pl031: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/90e0bcc9392d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
