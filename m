Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A98A42A0B77
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 17:43:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68AE5C3FADC;
	Fri, 30 Oct 2020 16:43:07 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A8FAC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 16:43:05 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id q1so7053024ilt.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 09:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZmqGfCg08N6iXx9q7TVWlSnhQqIDOwOjzOwbvXDxjI=;
 b=INVfZz/fkvsZivy8jdRFY4jjuumPUnT03fIMmAZxhr2j3OQtTxmqWeMui9FFLMvZFz
 QB2ePhBsJkuNysGjMHbU9DiLLxlLmss4JFzjBmUNAkJoiiGzYBFH/upOKm0AUQMizu+W
 okAB9PgkVOM5lyq7RfM3eZWziu4Lw6xFmIPsA3WEdWrepzCLkMsPGFysW4PIdG4Ix46W
 ABDHiqA089OjzR7YGXqWWnY73UPmGi5ssu5dObic6I8EipSHtDNSFTIEabkYZFtOUw53
 gKZFvyCe8mIA4cQPQ5Ji/NguzzOPrnGBpJ5jXdtWnz2BLO+k8PETRjkg1JznRZelvTOY
 uyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZmqGfCg08N6iXx9q7TVWlSnhQqIDOwOjzOwbvXDxjI=;
 b=Ss/fEJumHim3knEuf17/OFicuOOQu0c/gr5bnGcfcC5GWWUElF0RhrIPF+0L+afP57
 tZQjDywWCW9T78NnzRQJdc9GVjLM5VohMBIq5LzqztHsIbRtcZKLH+GftQlg5Cth14EZ
 XzbbcT4wEfpj2OCgqHYSeWB3HONVE3Z0UFl5SecsuznuZRfNzPYLWIBybGd1D20vmHlq
 5yYK4YRU1ZLXyc+T0fQOz2ToxtkGkY4uA8/V3UhG/JZKN7yZVPe+Fes1vOUABiEDzBQk
 hTcLMp58O+5fgJG1zO2WHJMHgV5cMx4dQJdgepgvjl+vu0XbV48A0vEqNQM4AvlRdo6L
 vAig==
X-Gm-Message-State: AOAM530pST24F0Wdzc5ZA2Uzo5hvIYHaQBzF+SgcArF+okVTxvuMMgwH
 Tn9cD9Fj/CRwdSkh800WNKxwY/27b4AnCLSgX5JVqA==
X-Google-Smtp-Source: ABdhPJwYf7SWuKIRh8xsBOBodbVLmuU+KCM1QaVpZsez95JZOYKTbDYung3PLxm+lfmttII+vBXdnzsUUs8NHjrseg0=
X-Received: by 2002:a92:6403:: with SMTP id y3mr2528711ilb.72.1604076184121;
 Fri, 30 Oct 2020 09:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
In-Reply-To: <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 30 Oct 2020 10:42:53 -0600
Message-ID: <CANLsYkxc2uzA57Hg5OX31JOx08JCZfynzebjABv=6H01796xGA@mail.gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Peter Chen <peter.chen@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Christian Gromm <christian.gromm@microchip.com>,
 ceph-devel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org,
 Danil Kipnis <danil.kipnis@cloud.ionos.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org,
 Alexander Antonov <alexander.antonov@linux.intel.com>,
 Dan Murphy <dmurphy@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Achatz <erazor_de@users.sourceforge.net>,
 Konstantin Khlebnikov <koct9i@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Wu Hao <hao.wu@intel.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Hanjun Guo <guohanjun@huawei.com>, Oleh Kravchenko <oleg@kaa.org.ua>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Saravana Kannan <saravanak@google.com>, Anton Vorontsov <anton@enomsg.org>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Len Brown <lenb@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Coresight ML <coresight@lists.linaro.org>, linux-media@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Oded Gabbay <oded.gabbay@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
 linux-gpio@vger.kernel.org, Dongsheng Yang <dongsheng.yang@easystack.cn>,
 linux-f2fs-devel@lists.sourceforge.net, Jarkko Sakkinen <jarkko@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jonas Meurer <jonas@freesources.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Mark Gross <mgross@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Ilya Dryomov <idryomov@gmail.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Kees Cook <keescook@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Roman Sudarikov <roman.sudarikov@linux.intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-i3c@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Russell King <linux@armlinux.org.uk>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Kajol Jain <kjain@linux.ibm.com>, Chao Yu <chao@kernel.org>,
 Johan Hovold <johan@kernel.org>, Andreas Klinger <ak@it-klinger.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, linux-iio@vger.kernel.org,
 Asutosh Das <asutoshd@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v2 31/39] docs: ABI: cleanup several ABI
	documents
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

On Fri, 30 Oct 2020 at 01:41, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> There are some ABI documents that, while they don't generate
> any warnings, they have issues when parsed by get_abi.pl script
> on its output result.
>
> Address them, in order to provide a clean output.
>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for IIO
> Reviewed-by: Tom Rix <trix@redhat.com> # for fpga-manager
> Reviewed-By: Kajol Jain<kjain@linux.ibm.com> # for sysfs-bus-event_source-devices-hv_gpci and sysfs-bus-event_source-devices-hv_24x7
> Acked-by: Oded Gabbay <oded.gabbay@gmail.com> # for Habanalabs
> Acked-by: Vaibhav Jain <vaibhav@linux.ibm.com> # for sysfs-bus-papr-pmem
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

>  .../testing/sysfs-bus-coresight-devices-etb10 |   5 +-

For the CoreSight part:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
