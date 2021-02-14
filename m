Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB231B155
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Feb 2021 17:58:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8F08C5719A;
	Sun, 14 Feb 2021 16:58:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACCE9C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Feb 2021 16:58:05 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43E00614A7;
 Sun, 14 Feb 2021 16:57:59 +0000 (UTC)
Date: Sun, 14 Feb 2021 16:57:52 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210214165752.59d41f98@archlinux>
In-Reply-To: <362a71a1eba98108d009db8c929170a6ed8cf110.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <362a71a1eba98108d009db8c929170a6ed8cf110.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 01/22] docs: counter: Consolidate
 Counter sysfs attributes documentation
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

On Fri, 12 Feb 2021 21:13:25 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> Duplicate ABIs are not valid, so let's consolidate these sysfs
> attributes into the main sysfs-bus-counter documentation file.

This is sensible to do, but is there any duplicate ABI?  I went
looking for any resulting build problems and couldn't see what was
actually duplicated.

Jonathan
> 
> Cc: Patrick Havelange <patrick.havelange@essensium.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-counter   | 76 ++++++++++++++++++-
>  .../ABI/testing/sysfs-bus-counter-104-quad-8  | 61 ---------------
>  .../ABI/testing/sysfs-bus-counter-ftm-quaddec | 16 ----
>  MAINTAINERS                                   |  4 +-
>  4 files changed, 75 insertions(+), 82 deletions(-)
>  delete mode 100644 Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
>  delete mode 100644 Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
> index 566bd99fe0a5..29f54484183f 100644
> --- a/Documentation/ABI/testing/sysfs-bus-counter
> +++ b/Documentation/ABI/testing/sysfs-bus-counter
> @@ -57,6 +57,7 @@ Description:
>  What:		/sys/bus/counter/devices/counterX/countY/count_mode_available
>  What:		/sys/bus/counter/devices/counterX/countY/error_noise_available
>  What:		/sys/bus/counter/devices/counterX/countY/function_available
> +What:		/sys/bus/counter/devices/counterX/countY/prescaler_available
>  What:		/sys/bus/counter/devices/counterX/countY/signalZ_action_available
>  KernelVersion:	5.2
>  Contact:	linux-iio@vger.kernel.org
> @@ -154,6 +155,15 @@ Description:
>  		Count Y. If possible, this should match the name of the
>  		respective channel as it appears in the device datasheet.
>  
> +What:		/sys/bus/counter/devices/counterX/countY/prescaler
> +KernelVersion:	5.2
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Configure the prescaler value associated with Count Y.
> +		On the FlexTimer, the counter clock source passes through a
> +		prescaler (i.e. a counter). This acts like a clock
> +		divider.
> +
>  What:		/sys/bus/counter/devices/counterX/countY/preset
>  KernelVersion:	5.2
>  Contact:	linux-iio@vger.kernel.org
> @@ -215,11 +225,45 @@ Description:
>  		Read-only attribute that indicates the total number of Signals
>  		belonging to the Counter.
>  
> -What:		/sys/bus/counter/devices/counterX/signalY/signal
> +What:		/sys/bus/counter/devices/counterX/signalY/cable_fault
> +KernelVersion:	5.7
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Read-only attribute that indicates whether a differential
> +		encoder cable fault (not connected or loose wires) is detected
> +		for the respective channel of Signal Y. Valid attribute values
> +		are boolean. Detection must first be enabled via the
> +		corresponding cable_fault_enable attribute.
> +
> +What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_enable
> +KernelVersion:	5.7
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Whether detection of differential encoder cable faults for the
> +		respective channel of Signal Y is enabled. Valid attribute
> +		values are boolean.
> +
> +What:		/sys/bus/counter/devices/counterX/signalY/filter_clock_prescaler
> +KernelVersion:	5.7
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Filter clock factor for input Signal Y. This prescaler value
> +		affects the inputs of both quadrature pair signals.
> +
> +What:		/sys/bus/counter/devices/counterX/signalY/index_polarity
>  KernelVersion:	5.2
>  Contact:	linux-iio@vger.kernel.org
>  Description:
> -		Signal data of Signal Y represented as a string.
> +		Active level of index input Signal Y; irrelevant in
> +		non-synchronous load mode.
> +
> +What:		/sys/bus/counter/devices/counterX/signalY/index_polarity_available
> +What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode_available
> +KernelVersion:	5.2
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Discrete set of available values for the respective Signal Y
> +		configuration are listed in this file.
>  
>  What:		/sys/bus/counter/devices/counterX/signalY/name
>  KernelVersion:	5.2
> @@ -228,3 +272,31 @@ Description:
>  		Read-only attribute that indicates the device-specific name of
>  		Signal Y. If possible, this should match the name of the
>  		respective signal as it appears in the device datasheet.
> +
> +What:		/sys/bus/counter/devices/counterX/signalY/signal
> +KernelVersion:	5.2
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Signal data of Signal Y represented as a string.
> +
> +What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode
> +KernelVersion:	5.2
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		Configure the counter associated with Signal Y for
> +		non-synchronous or synchronous load mode. Synchronous load mode
> +		cannot be selected in non-quadrature (Pulse-Direction) clock
> +		mode.
> +
> +		non-synchronous:
> +			A logic low level is the active level at this index
> +			input. The index function (as enabled via preset_enable)
> +			is performed directly on the active level of the index
> +			input.
> +
> +		synchronous:
> +			Intended for interfacing with encoder Index output in
> +			quadrature clock mode. The active level is configured
> +			via index_polarity. The index function (as enabled via
> +			preset_enable) is performed synchronously with the
> +			quadrature clock on the active level of the index input.
> diff --git a/Documentation/ABI/testing/sysfs-bus-counter-104-quad-8 b/Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
> deleted file mode 100644
> index eac32180c40d..000000000000
> --- a/Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -What:		/sys/bus/counter/devices/counterX/signalY/cable_fault
> -KernelVersion:	5.7
> -Contact:	linux-iio@vger.kernel.org
> -Description:
> -		Read-only attribute that indicates whether a differential
> -		encoder cable fault (not connected or loose wires) is detected
> -		for the respective channel of Signal Y. Valid attribute values
> -		are boolean. Detection must first be enabled via the
> -		corresponding cable_fault_enable attribute.
> -
> -What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_enable
> -KernelVersion:	5.7
> -Contact:	linux-iio@vger.kernel.org
> -Description:
> -		Whether detection of differential encoder cable faults for the
> -		respective channel of Signal Y is enabled. Valid attribute
> -		values are boolean.
> -
> -What:		/sys/bus/counter/devices/counterX/signalY/filter_clock_prescaler
> -KernelVersion:	5.7
> -Contact:	linux-iio@vger.kernel.org
> -Description:
> -		Filter clock factor for input Signal Y. This prescaler value
> -		affects the inputs of both quadrature pair signals.
> -
> -What:		/sys/bus/counter/devices/counterX/signalY/index_polarity
> -KernelVersion:	5.2
> -Contact:	linux-iio@vger.kernel.org
> -Description:
> -		Active level of index input Signal Y; irrelevant in
> -		non-synchronous load mode.
> -
> -What:		/sys/bus/counter/devices/counterX/signalY/index_polarity_available
> -What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode_available
> -KernelVersion:	5.2
> -Contact:	linux-iio@vger.kernel.org
> -Description:
> -		Discrete set of available values for the respective Signal Y
> -		configuration are listed in this file.
> -
> -What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode
> -KernelVersion:	5.2
> -Contact:	linux-iio@vger.kernel.org
> -Description:
> -		Configure the counter associated with Signal Y for
> -		non-synchronous or synchronous load mode. Synchronous load mode
> -		cannot be selected in non-quadrature (Pulse-Direction) clock
> -		mode.
> -
> -		non-synchronous:
> -			A logic low level is the active level at this index
> -			input. The index function (as enabled via preset_enable)
> -			is performed directly on the active level of the index
> -			input.
> -
> -		synchronous:
> -			Intended for interfacing with encoder Index output in
> -			quadrature clock mode. The active level is configured
> -			via index_polarity. The index function (as enabled via
> -			preset_enable) is performed synchronously with the
> -			quadrature clock on the active level of the index input.
> diff --git a/Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec b/Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec
> deleted file mode 100644
> index 7d2e7b363467..000000000000
> --- a/Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -What:		/sys/bus/counter/devices/counterX/countY/prescaler_available
> -KernelVersion:	5.2
> -Contact:	linux-iio@vger.kernel.org
> -Description:
> -		Discrete set of available values for the respective Count Y
> -		configuration are listed in this file. Values are delimited by
> -		newline characters.
> -
> -What:		/sys/bus/counter/devices/counterX/countY/prescaler
> -KernelVersion:	5.2
> -Contact:	linux-iio@vger.kernel.org
> -Description:
> -		Configure the prescaler value associated with Count Y.
> -		On the FlexTimer, the counter clock source passes through a
> -		prescaler (i.e. a counter). This acts like a clock
> -		divider.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e697044d34d6..d858582c917b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -297,7 +297,6 @@ M:	William Breathitt Gray <vilhelm.gray@gmail.com>
>  M:	Syed Nayyar Waris <syednwaris@gmail.com>
>  L:	linux-iio@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
>  F:	drivers/counter/104-quad-8.c
>  
>  ACCES PCI-IDIO-16 GPIO DRIVER
> @@ -4540,7 +4539,7 @@ COUNTER SUBSYSTEM
>  M:	William Breathitt Gray <vilhelm.gray@gmail.com>
>  L:	linux-iio@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/ABI/testing/sysfs-bus-counter*
> +F:	Documentation/ABI/testing/sysfs-bus-counter
>  F:	Documentation/driver-api/generic-counter.rst
>  F:	drivers/counter/
>  F:	include/linux/counter.h
> @@ -6925,7 +6924,6 @@ FLEXTIMER FTM-QUADDEC DRIVER
>  M:	Patrick Havelange <patrick.havelange@essensium.com>
>  L:	linux-iio@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec
>  F:	Documentation/devicetree/bindings/counter/ftm-quaddec.txt
>  F:	drivers/counter/ftm-quaddec.c
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
