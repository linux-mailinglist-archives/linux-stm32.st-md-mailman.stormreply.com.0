Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF4126D3D5
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Sep 2020 08:41:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3A03C3FAFF;
	Thu, 17 Sep 2020 06:41:17 +0000 (UTC)
Received: from 2.mo2.mail-out.ovh.net (2.mo2.mail-out.ovh.net [188.165.53.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9309FC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 16:31:18 +0000 (UTC)
Received: from player738.ha.ovh.net (unknown [10.108.54.203])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 3A4331E7D18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 18:31:18 +0200 (CEST)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
 (Authenticated sender: andi@etezian.org)
 by player738.ha.ovh.net (Postfix) with ESMTPSA id 58AA51654073D;
 Wed, 16 Sep 2020 16:31:06 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003434935c3-d5be-4bfb-9d38-1f2210c8509c,
 E220774DB7FC1891A64BD699B7E3BDDD469A7482) smtp.auth=andi@etezian.org
Date: Wed, 16 Sep 2020 19:31:05 +0300
From: Andi Shyti <andi@etezian.org>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20200916163105.GB50769@jack.zhora.eu>
References: <20200916141941.16684-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916141941.16684-1-yuehaibing@huawei.com>
X-Ovh-Tracer-Id: 4455748883065979445
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucggtffrrghtthgvrhhnpedtgfduudfhfeeuueejfeeihedtfeetgfegveehgfeuleelhfduteegieekudeifeenucfkpheptddrtddrtddrtddpvddufedrvdegfedrudeguddrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomh
X-Mailman-Approved-At: Thu, 17 Sep 2020 06:41:17 +0000
Cc: mcoquelin.stm32@gmail.com, robh@kernel.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, javier@osg.samsung.com, andi@etezian.org,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] Input: stmfts - Fix a & vs && typo
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

Hi YueHaibing,

On Wed, Sep 16, 2020 at 10:19:41PM +0800, YueHaibing wrote:
> In stmfts_sysfs_hover_enable_write(), we should check
> value and sdata->hover_enabled is all true.
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Andi Shyti <andi@etezian.org>

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
