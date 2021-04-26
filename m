Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7702236BF6F
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Apr 2021 08:48:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A84C57B6F;
	Tue, 27 Apr 2021 06:48:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65F9BC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 17:40:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13QHdceX127088;
 Mon, 26 Apr 2021 12:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1619458778;
 bh=7Q9DDfAP0kb5SVHmvxLJjeJZszWfE6DMCeCuhgLXXUE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=tfabWYY35jAV4kpab9Eai+2VgkyqR+jQZGfz5CQbHsJFy/MNbQ7Mwhanuri2SXlxx
 Q6X80MPHdW0mAWXE0aUXbg2FyenLY3e04ylbWZlhzS+d4NSGG999MbXdbUSBFTUAoN
 FcGrMsbKfUvfAyKCp9UcUPwpx8ZIBUFdRYz0VhOE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13QHdbkF128085
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Apr 2021 12:39:37 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 26
 Apr 2021 12:39:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 26 Apr 2021 12:39:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13QHdavH085058;
 Mon, 26 Apr 2021 12:39:37 -0500
Date: Mon, 26 Apr 2021 23:09:36 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20210426173934.zigt6b66ieuzuchy@ti.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
 <20210426162610.erpt5ubeddx7paeq@ti.com>
 <20210426165118.GH4590@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426165118.GH4590@sirena.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 27 Apr 2021 06:48:09 +0000
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] spi: spi-mem: add automatic poll
	status functions
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

On 26/04/21 05:51PM, Mark Brown wrote:
> On Mon, Apr 26, 2021 at 09:56:12PM +0530, Pratyush Yadav wrote:
> > On 26/04/21 04:39PM, patrice.chotard@foss.st.com wrote:
> 
> > > + * spi_mem_poll_status() - Poll memory device status
> > > + * @mem: SPI memory device
> > > + * @op: the memory operation to execute
> > > + * @mask: status bitmask to ckeck
> > > + * @match: status expected value
> 
> > Technically, (status & mask) expected value. Dunno if that is obvious 
> > enough to not spell out explicitly.
> 
> Is it possible there's some situation where you're waiting for some bits
> to clear as well?

Yes. In fact, that is the more common situation. Both SPI NOR 
(spi_nor_sr_ready()) and SPI NAND (spinand_wait()) need to wait for the 
"busy" bit to be cleared.

AFAICT this API is supposed to check for (status & mask) == (match & 
mask) so it should be able to handle both polarities for the bits being 
polled.

> 
> > > +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match, timeout);
> 
> I'm not sure I like this name since it makes me think the driver is
> going to poll when really it's offloaded to the hardware, but I can't
> think of any better ideas either and it *is* what the hardware is going
> to be doing so meh.
> 
> > I wonder if it is better to let spi-mem core take care of the timeout 
> > part. On one hand it reduces code duplication on the driver side a 
> > little bit. Plus it makes sure drivers don't mess anything up with bad 
> > (or no) handling of the timeout. But on the other hand the interface 
> > becomes a bit awkward since you'd have to pass a struct completion 
> > around, and it isn't something particularly hard to get right either. 
> > What do you think?
> 
> We already have the core handling other timeouts.  We don't pass around
> completions but rather have an API function that the driver has to call
> when the operation completes, a similar pattern might work here.  Part
> of the thing with those APIs which I'm missing here is that this will
> just return -EOPNOTSUPP if the driver can't do the delay in hardware, I
> think it would be cleaner if this API were similar and the core dealt
> with doing the delay/poll on the CPU.  That way the users don't need to
> repeat the handling for the offload/non-offload cases.

Makes sense to me.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
