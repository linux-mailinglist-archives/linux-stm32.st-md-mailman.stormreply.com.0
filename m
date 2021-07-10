Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D45C3C3599
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jul 2021 19:07:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B60AAC57B60;
	Sat, 10 Jul 2021 17:07:03 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C818C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jul 2021 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F3dxVd9EJ5mEHpXDj1LpSHlp8jLyHIKmRh7AqA12FRs=; b=Wo8uUtFUJlsDVaahV4H1MUQ2JG
 fBcwQCbT4gcjZotUKE73BDc+3KP+bPyNauXGk1xNdMRozpzxUfjo4IzQxzilreksKrLHuYngn380d
 GsyobHVYUkuKU3hRo1/VbojyUHVTVDzCPaXxJX6x3sHuinafF/c1QuxNqY02mi1iYdhnWwykfEX1M
 DiTMGQRKysNCFSfgPTy9VvqnZu7mJl2wppHnsvvlKeKnEe2j/LzP8O4M+1x29mOfwCmj99KJRRSN6
 E2Axe36yR4eYFZDzha43pbwtiz4SyRk5d7d3GmYYg7zb3ePJ7x+vNfNvK7DYpqF3fsFZWRaozQLew
 qNGxySHA==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:46940 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1m2GR8-00Gjkq-Cn; Sat, 10 Jul 2021 13:06:57 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <0e04a9e6455faf171e5dd7885676e55b5321b1ea.1625471640.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <bd0313ce-22fa-0516-93a1-ff3a5cb1fdd1@lechnology.com>
Date: Sat, 10 Jul 2021 12:06:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0e04a9e6455faf171e5dd7885676e55b5321b1ea.1625471640.git.vilhelm.gray@gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, jarkko.nikula@linux.intel.com,
 Dan Carpenter <dan.carpenter@oracle.com>, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 7/5/21 3:19 AM, William Breathitt Gray wrote:
> The Generic Counter chrdev interface expects users to supply component
> IDs in order to select extensions for requests. In order for users to
> know what component ID belongs to which extension this information must
> be exposed. The *_component_id attribute provides a way for users to
> discover what component ID belongs to which respective extension.
> 
> Cc: David Lechner <david@lechnology.com>
> Cc: Gwendal Grignou <gwendal@chromium.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>   Documentation/ABI/testing/sysfs-bus-counter | 16 ++++++++++-
>   drivers/counter/counter-sysfs.c             | 30 ++++++++++++++++-----
>   2 files changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
> index 9809d8a47431..e0e99adb0ecc 100644
> --- a/Documentation/ABI/testing/sysfs-bus-counter
> +++ b/Documentation/ABI/testing/sysfs-bus-counter
> @@ -203,12 +203,26 @@ Description:
>   		both edges:
>   			Any state transition.
>   
> +What:		/sys/bus/counter/devices/counterX/countY/ceiling_component_id
> +What:		/sys/bus/counter/devices/counterX/countY/floor_component_id
> +What:		/sys/bus/counter/devices/counterX/countY/count_mode_component_id
> +What:		/sys/bus/counter/devices/counterX/countY/direction_component_id
> +What:		/sys/bus/counter/devices/counterX/countY/enable_component_id
> +What:		/sys/bus/counter/devices/counterX/countY/error_noise_component_id
> +What:		/sys/bus/counter/devices/counterX/countY/prescaler_component_id
> +What:		/sys/bus/counter/devices/counterX/countY/preset_component_id
> +What:		/sys/bus/counter/devices/counterX/countY/preset_enable_component_id
>   What:		/sys/bus/counter/devices/counterX/countY/signalZ_action_component_id
> +What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_component_id
> +What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_enable_component_id
> +What:		/sys/bus/counter/devices/counterX/signalY/filter_clock_prescaler_component_id
> +What:		/sys/bus/counter/devices/counterX/signalY/index_polarity_component_id
> +What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode_component_id

Could we just write a single line?

What:		/sys/bus/counter/devices/counterX/signalY/<component>_component_id

>   KernelVersion:	5.15
>   Contact:	linux-iio@vger.kernel.org
>   Description:
>   		Read-only attribute that indicates the component ID of the
> -		respective Synapse of Count Y for Signal Z.
> +		respective extension or Synapse.
>   
>   What:		/sys/bus/counter/devices/counterX/countY/spike_filter_ns
>   KernelVersion:	5.14
> diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
> index bb49a10f160b..eb1505bfbd89 100644
> --- a/drivers/counter/counter-sysfs.c
> +++ b/drivers/counter/counter-sysfs.c
> @@ -587,6 +587,7 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
>   	int err;
>   	struct counter_comp comp;
>   	size_t i;
> +	struct counter_comp *ext;
>   
>   	/* Create main Signal attribute */
>   	comp = counter_signal_comp;
> @@ -602,8 +603,13 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
>   
>   	/* Create an attribute for each extension */
>   	for (i = 0; i < signal->num_ext; i++) {
> -		err = counter_attr_create(dev, group, signal->ext + i, scope,
> -					  signal);
> +		ext = signal->ext + i;
> +
> +		err = counter_attr_create(dev, group, ext, scope, signal);
> +		if (err < 0)
> +			return err;
> +
> +		err = counter_comp_id_attr_create(dev, group, ext->name, i);
>   		if (err < 0)
>   			return err;
>   	}
> @@ -694,6 +700,7 @@ static int counter_count_attrs_create(struct counter_device *const counter,
>   	int err;
>   	struct counter_comp comp;
>   	size_t i;
> +	struct counter_comp *ext;
>   
>   	/* Create main Count attribute */
>   	comp = counter_count_comp;
> @@ -718,8 +725,13 @@ static int counter_count_attrs_create(struct counter_device *const counter,
>   
>   	/* Create an attribute for each extension */
>   	for (i = 0; i < count->num_ext; i++) {
> -		err = counter_attr_create(dev, group, count->ext + i, scope,
> -					  count);
> +		ext = count->ext + i;

		ext = &count->ext[i];

Could make it more clear we are dealing with pointers rather than integers.

> +
> +		err = counter_attr_create(dev, group, ext, scope, count);
> +		if (err < 0)
> +			return err;
> +
> +		err = counter_comp_id_attr_create(dev, group, ext->name, i);
>   		if (err < 0)
>   			return err;
>   	}
> @@ -783,6 +795,7 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
>   	struct device *const dev = &counter->dev;
>   	int err;
>   	size_t i;
> +	struct counter_comp *ext;
>   
>   	/* Add Signals sysfs attributes */
>   	err = counter_sysfs_signals_add(counter, group);
> @@ -815,8 +828,13 @@ static int counter_sysfs_attr_add(struct counter_device *const counter,
>   
>   	/* Create an attribute for each extension */
>   	for (i = 0; i < counter->num_ext; i++) {
> -		err = counter_attr_create(dev, group, counter->ext + i, scope,
> -					  NULL);
> +		ext = counter->ext + i;

ditto

> +
> +		err = counter_attr_create(dev, group, ext, scope, NULL);
> +		if (err < 0)
> +			return err;
> +
> +		err = counter_comp_id_attr_create(dev, group, ext->name, i);
>   		if (err < 0)
>   			return err;
>   	}
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
