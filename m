Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D64F2ADE11
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Nov 2020 19:19:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62A02C35E2B;
	Tue, 10 Nov 2020 18:19:32 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2795DC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Nov 2020 18:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Ct6aE0Bm8FKKbzyR0cHse7bKKnoXTwBFYl7S9+AHa7M=; b=RFBBplucvygNQ6kLC7amRs2zQ2
 jtuZiTjE7qGN10yc9ZPOrch35q8ioF7bOSvZrVS3CaHAbmRER2RiMQ05VaJEbNKHvh/5BR0O541V2
 Gca/C1mlMqiRD0ABv+Mep2UJ4C1tdOAmjsGmAFXtgHMbf/ZnmKYTa/b/tE++H7sZr3i6NPxdJiFLc
 zZXogcHmMGNFpI3oq7mSneRkgpFUNihyVjwMuW9UXJ6iN7LW82vA/iOo7qS8rBiRYbxtO9DblFakc
 GUdAR8qdE3T1a6EbsoAshklApxvl/ps5eNoUhe4tNlZDdG1fN96lpd4jIJXkVB/fkaHCdXIfsK4xm
 +2iXQ7/A==;
Received: from [2601:1c0:6280:3f0::662d]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcYES-0001S3-4s; Tue, 10 Nov 2020 18:19:04 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <58cf3c2d611e0197fb215652719ebd82ca2658db.1604042072.git.mchehab+huawei@kernel.org>
 <5326488b-4185-9d67-fc09-79b911fbb3b8@st.com>
 <20201030110925.3e09d59e@coco.lan>
 <cb586ea3-b6e6-4e48-2344-2bd641e5323f@st.com>
 <20201102124641.GA881895@kroah.com> <20201102154250.45bee17f@coco.lan>
 <20201108165621.4d0da3f4@archlinux> <20201110082658.2edc1ab5@coco.lan>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aa855d9a-4fc6-2b64-b6b7-69409af3f9d0@infradead.org>
Date: Tue, 10 Nov 2020 10:18:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201110082658.2edc1ab5@coco.lan>
Content-Language: en-US
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Petr Mladek <pmladek@suse.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Sebastian Reichel <sre@kernel.org>,
 linux-mm@kvack.org, Bruno Meneguele <bmeneg@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Pavel Machek <pavel@ucw.cz>, Hanjun Guo <guohanjun@huawei.com>,
 Guenter Roeck <groeck@chromium.org>, netdev@vger.kernel.org,
 Oleh Kravchenko <oleg@kaa.org.ua>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 =?UTF-8?Q?Javier_Gonz=c3=a1lez?= <javier@javigon.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Mark Gross <mgross@linux.intel.com>,
 linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Tom Rix <trix@redhat.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Len Brown <lenb@kernel.org>, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Oded Gabbay <oded.gabbay@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Dan Murphy <dmurphy@ti.com>,
 Orson Zhai <orsonzhai@gmail.com>, Philippe Bergheaud <felix@linux.ibm.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Konstantin Khlebnikov <koct9i@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Leonid Maksymchuk <leonmaxx@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Rosin <peda@axentia.se>, Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [Linux-stm32] Duplicated ABI entries - Was: Re: [PATCH v2
 20/39] docs: ABI: testing: make the files compatible with ReST output
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

On 11/9/20 11:26 PM, Mauro Carvalho Chehab wrote:
> Hi Jonathan,
> 
> Let's view ABI from the PoV of a system admin that doesn't know
> yet about a certain ABI symbol.
> 
> He'll try to seek for the symbol, more likely using the HTML 
> documentation. Only very senior system admins might try to take
> a look at the Kernel.

FWIW, I think that the likely search methods are $search_engine
and 'grep'.

Have a good few days off.

-- 
~Randy

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
