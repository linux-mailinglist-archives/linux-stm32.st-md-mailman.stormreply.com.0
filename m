Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9294E3C4674
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jul 2021 12:19:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 382FFC57B6B;
	Mon, 12 Jul 2021 10:19:33 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F809C57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jul 2021 10:19:30 +0000 (UTC)
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GNfbt4Jx0z6GFRQ;
 Mon, 12 Jul 2021 18:08:26 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 12 Jul 2021 12:19:28 +0200
Received: from localhost (10.47.25.8) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 12 Jul
 2021 11:19:27 +0100
Date: Mon, 12 Jul 2021 11:19:09 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20210712111909.00004f72@Huawei.com>
In-Reply-To: <72d6513c-c7fc-c53d-b750-ebd2e8f3b848@lechnology.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <0e04a9e6455faf171e5dd7885676e55b5321b1ea.1625471640.git.vilhelm.gray@gmail.com>
 <bd0313ce-22fa-0516-93a1-ff3a5cb1fdd1@lechnology.com>
 <20210711142800.60e94cc7@jic23-huawei>
 <72d6513c-c7fc-c53d-b750-ebd2e8f3b848@lechnology.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.47.25.8]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, mcoquelin.stm32@gmail.com,
 alexandre.belloni@bootlin.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, jarkko.nikula@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Dan Carpenter <dan.carpenter@oracle.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Cameron <jic23@kernel.org>, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 14/17] counter: Implement
 *_component_id sysfs attributes
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

On Sun, 11 Jul 2021 09:08:29 -0500
David Lechner <david@lechnology.com> wrote:

> On 7/11/21 8:28 AM, Jonathan Cameron wrote:
> > On Sat, 10 Jul 2021 12:06:53 -0500
> > David Lechner <david@lechnology.com> wrote:
> >   
> >> On 7/5/21 3:19 AM, William Breathitt Gray wrote:  
> >>> The Generic Counter chrdev interface expects users to supply component
> >>> IDs in order to select extensions for requests. In order for users to
> >>> know what component ID belongs to which extension this information must
> >>> be exposed. The *_component_id attribute provides a way for users to
> >>> discover what component ID belongs to which respective extension.
> >>>
> >>> Cc: David Lechner <david@lechnology.com>
> >>> Cc: Gwendal Grignou <gwendal@chromium.org>
> >>> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> >>> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> >>> ---
> >>>    Documentation/ABI/testing/sysfs-bus-counter | 16 ++++++++++-
> >>>    drivers/counter/counter-sysfs.c             | 30 ++++++++++++++++-----
> >>>    2 files changed, 39 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
> >>> index 9809d8a47431..e0e99adb0ecc 100644
> >>> --- a/Documentation/ABI/testing/sysfs-bus-counter
> >>> +++ b/Documentation/ABI/testing/sysfs-bus-counter
> >>> @@ -203,12 +203,26 @@ Description:
> >>>    		both edges:
> >>>    			Any state transition.
> >>>    
> >>> +What:		/sys/bus/counter/devices/counterX/countY/ceiling_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/countY/floor_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/countY/count_mode_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/countY/direction_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/countY/enable_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/countY/error_noise_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/countY/prescaler_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/countY/preset_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/countY/preset_enable_component_id
> >>>    What:		/sys/bus/counter/devices/counterX/countY/signalZ_action_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_enable_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/signalY/filter_clock_prescaler_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/signalY/index_polarity_component_id
> >>> +What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode_component_id  
> >>
> >> Could we just write a single line?
> >>
> >> What:		/sys/bus/counter/devices/counterX/signalY/<component>_component_id  
> > 
> > Not nice for grepping so I think it's better to call them out explicitly.
> > 
> > There has been a proposal to check this ABI doc against running kernels, and if we have
> > too many wild cards that becomes very difficult to do.
> > 
> > Jonathan
> >   
> >>  
> >>>    KernelVersion:	5.15  
> 
> Makes sense. Do we start a new group of similar names with the same
> description for each kernel release that includes new attributes then?

You've spotted one of the short comings of current format.  The scripts that
produce the html docs don't cope with multiple version numbers.

Mostly for IIO we've just been cynical and not had the correct kernel version for
new ABI when it's added. It's not ideal though.

The alternative, as you mention is to have a new block.  Perhaps we can have
that refer back to the existing one if the docs cover the new entries as well.

@Mauro:  Any suggestions for this?

Thanks

Jonathan


> 
> >>>    Contact:	linux-iio@vger.kernel.org
> >>>    Description:
> >>>    		Read-only attribute that indicates the component ID of the
> >>> -		respective Synapse of Count Y for Signal Z.
> >>> +		respective extension or Synapse.
> >>>      

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
