Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0A5ACD9FE
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jun 2025 10:39:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4299BC32E92;
	Wed,  4 Jun 2025 08:39:00 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5978BC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 08:38:59 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 9EEC72540126;
 Wed,  4 Jun 2025 04:38:57 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Wed, 04 Jun 2025 04:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1749026337;
 x=1749112737; bh=n5JAJEL2oW4vd7E9p4FbaR7i6iB6+wvOYm4qzAl4WN8=; b=
 VE9R3vhuln2wknGNiHJ+5Og/KQglay9qXjlo9mwy2+4TWSB0bm8mW1rabJHuTs6r
 T8z3kodpBmioUO8PtBK0Aa531IYURE5OxzmCADegNFKhJOYPMk7r/an6tGiszHus
 4JfnwEotoZYPIxbQzgJSdJuagErNLwlhTmCf9mxj7gapMPeaHeeKdSZI1SGxfnko
 XoGnLiUk98ADqRtR7KI+REnj/FHXbWIYEgndOWWl84OIivSc0BsZPbFdqqpuzOhZ
 wgHV9hSwq7WAlbZwfKEDrV/BWGaIlofUmd7cW7TU6k+XMyG65pIVX3VSs+7tYOV9
 rwsR5i6Whrf/frs6V6ye9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749026337; x=
 1749112737; bh=n5JAJEL2oW4vd7E9p4FbaR7i6iB6+wvOYm4qzAl4WN8=; b=Q
 ce+ATV8TSeTSqeXU0Ek+s1CyaB6I3j8F2GhjsH2DF16QTeI092GbCVYsoiMtiQ8n
 IES4GJwj11VODQMt3m3/+GpN5ntGCVwasWHo33kIM04GGA16mSKYgnPkVh/HNJCv
 XOnksuvNIE1kHL6tSuEiAidWxU3yF6N43/gOFJenC3aZlAyDMpxeJxwbFjv8Kv8L
 0ABuY6mS3AOAYs/zV9+CPTh0DFGUR3bPnw7V9j9pCr5FHp5FpYra2OUk1LX+E+mI
 VGtS5D3o38+2Wczq/6fH54xPChtXcHP+uKrDk38Vm4Rw0d8oyb8dRLjpK1NYGQ3j
 6cmOYRgAsX6NfWT++d7DA==
X-ME-Sender: <xms:IAZAaKC_iQ8roRrkXmBaA-PFQS92Ny4zk77d95ZVBOMieWyJTaFb0g>
 <xme:IAZAaEhzRg8F0huJYZhmtjImx3YaAAyV8QmOTApRH8Fp3jvoefn3KLnwqC-lj_tT8
 aNbaE_UdTw3SLhsVtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
 guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
 gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
 mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguh
 gvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepfhgrsghivghnrdguvghsshgvnhhn
 vgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehlihhonhgvlhdruggvsghivghvvg
 esfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedv
 sehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprh
 gtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
 nhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrd
 gtohhmpdhrtghpthhtoheplhhinhhugidqtghrhihpthhosehvghgvrhdrkhgvrhhnvghl
 rdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
 hlrdhorhhg
X-ME-Proxy: <xmx:IAZAaNkdUnrakb0WjI41MEgPWwJtVzJpg9ci5ztvzeQrQ0Vpoi4dfw>
 <xmx:IAZAaIwXt9JaRH5T3EEvl6WkhdKTI52SnWWA_fTECz8OYol20reEZQ>
 <xmx:IAZAaPSScJAgL3xtSkiM7_z8yD_57gmOzgKxp1QGf7IYQVzLlRqF1A>
 <xmx:IAZAaDZmzDXZVLBTDtmuUfGp29jMLCxGFfI-Yv9HGdHTGQqCcL1J3Q>
 <xmx:IQZAaOkxTPu1ZofEuTyzRW42FoeBsuNZw-A10CpHyzd3vLOrgZJpNb8h>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id BF76C700061; Wed,  4 Jun 2025 04:38:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tbb2e10097ecee1e7
Date: Wed, 04 Jun 2025 10:38:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-kernel@vger.kernel.org
Message-Id: <0c760b4f-4f52-4384-b663-3b08e4f92448@app.fastmail.com>
In-Reply-To: <20250601193441.6913-1-ebiggers@kernel.org>
References: <20250601193441.6913-1-ebiggers@kernel.org>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] crypto: stm32 - remove crc32 and
	crc32c support
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

On Sun, Jun 1, 2025, at 21:34, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Remove the crc32 and crc32c support from the stm32 driver.  Since it's
> not wired up to the CRC library, almost no CRC user in the kernel can
> actually be taking advantage of it, so it's effectively dead code.
>
> Support for this hardware could be migrated to the CRC library, but
> there doesn't seem to be much point.  This CRC engine is present only on
> a couple older SoCs that lacked CRC instructions.
>
> Even on those SoCs, it's probably not worthwhile.  This driver has to
> deal with things like locking and runtime power management that do not
> exist in software CRC code and are a source of bugs (as is clear from
> the commit log) and add significant overhead to the processing of short
> messages, which are common.  The patch that originally added this driver
> seemed to justify it based purely on a microbenchmark on Cortex-M7 on
> long messages, not a real use case.  These days, if this driver were to
> be used at all it would likely be on Cortex-A7 instead.  This CRC engine
> is also not supported by QEMU, making the driver not easily testable.
>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

As far as I can tell, the CRC unit was present on the original
24 MHz STM32F1 (Cortex-M3), where it probably had some merit, and
later chips including the STM32MP1 (Cortex-A7) just incorporated
the block for compatibility.

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
