Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B825D957877
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 01:09:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81528C6DD72;
	Mon, 19 Aug 2024 23:09:10 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DBA8C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 23:09:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AA74ECE0B42;
 Mon, 19 Aug 2024 23:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0CFC32782;
 Mon, 19 Aug 2024 23:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724108939;
 bh=huFSW0O9/vDWk3jLLuBeA3AMJ8s2sEkGg2pXPbb+s68=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QyqUujxrEN6dsd4ERQTt/YOI/cvdOUsxyzulCSEUBiuIHcUjbso3YoHhm+MDDjXT6
 kO9NWk4G1DxC2IVA3zkGg8srtPDyFLff5uhaOUiFK+NExsY+Ll691k0tYJtyjYNGGx
 R8ea/prAo67rf/R+QQhD3Rii19DVFFqisY3I2DnLQAE/IPfGUWcrv4lOPmRHd7VZGf
 JqTO87jDiHxQyeCkXr0+BfY4JpLeRz6Irhp6iVFLE8tq6EkfsJOK81XApXX7vxK3Wi
 PrCtt8OOS+xYZotvuJuNtHzD7KWzuisUw9dkFacyFCOLy1M7Z1lS5ujaSckETWGpk7
 a6Iem0/y3hWYQ==
Message-ID: <39af5ef3-04f5-4cfe-a486-6f14504d6a52@kernel.org>
Date: Tue, 20 Aug 2024 08:08:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Stanner <pstanner@redhat.com>, onathan Corbet <corbet@lwn.net>,
 Jens Axboe <axboe@kernel.dk>, Wu Hao <hao.wu@intel.com>,
 Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Xu Yilun <yilun.xu@intel.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-11-pstanner@redhat.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240819165148.58201-11-pstanner@redhat.com>
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 9/9] PCI: Remove pcim_iounmap_regions()
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

On 8/20/24 01:51, Philipp Stanner wrote:
> All users of pcim_iounmap_regions() have been removed by now.
> 
> Remove pcim_iounmap_regions().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
