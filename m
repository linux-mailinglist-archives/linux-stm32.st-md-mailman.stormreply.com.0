Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF996C9A9
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2019 09:02:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F4B2C0B1B2
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2019 07:02:57 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5918AC57B47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2019 16:13:50 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BBF80605C121F65CC65C;
 Thu, 18 Jul 2019 00:13:46 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Thu, 18 Jul 2019
 00:13:42 +0800
Date: Wed, 17 Jul 2019 17:13:20 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190717171320.000035c2@huawei.com>
In-Reply-To: <88d15fa38167e3f2e73e65e1c1a1f39bca0267b4.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
 <88d15fa38167e3f2e73e65e1c1a1f39bca0267b4.1563365880.git.mchehab+samsung@kernel.org>
Organization: Huawei
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 18 Jul 2019 07:02:56 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-mm@kvack.org, netdev@vger.kernel.org, Peter
 Meerwald-Stadler <pmeerw@pmeerw.net>, Guenter Roeck <groeck@chromium.org>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-acpi@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-pm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut
 Knaack <knaack.h@gmx.de>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [Linux-stm32] [PATCH v4 13/15] docs: ABI: testing: make the
 files compatible with ReST output
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

On Wed, 17 Jul 2019 09:28:17 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Some files over there won't parse well by Sphinx.
> 
> Fix them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Hi Mauro,

Does feel like this one should perhaps have been broken up a touch!

For the IIO ones I've eyeballed it rather than testing the results

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
