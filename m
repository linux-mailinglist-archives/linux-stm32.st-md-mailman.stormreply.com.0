Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 584382A2543
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Nov 2020 08:32:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F81CC424CC;
	Mon,  2 Nov 2020 07:32:24 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E0CDC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 08:28:14 +0000 (UTC)
IronPort-SDR: ehhrzIxv9IC0e3ux8OPI3XzdpnbgIqn9lqoz/wbQdtiZTbWpWQdcqSuzN+vu6wdKeOxM6dHWu7
 DJH/Ag8gRgjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165079874"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="165079874"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 01:28:12 -0700
IronPort-SDR: n1HHEB9ts0l6DRLrZkuICGJLMrYMWW0u6YftTRRadpfz7BwES/F6lRr74fLbRXgSa/FyDcLH01
 8I0qTKmcSuYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="361780723"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Oct 2020 01:27:54 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 30 Oct 2020 08:27:53 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Fri, 30 Oct 2020 08:27:53 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Thread-Topic: [PATCH v2 31/39] docs: ABI: cleanup several ABI documents
Thread-Index: AQHWrpAPMHjRWbJLhkqA2R8Yjt3++6mvz6Og
Date: Fri, 30 Oct 2020 08:27:53 +0000
Message-ID: <372d38f00a9349c6b14b0b00fb1a02b4@intel.com>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
In-Reply-To: <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Nov 2020 07:32:19 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, Peter Chen <peter.chen@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pavel Machek <pavel@ucw.cz>, Christian Gromm <christian.gromm@microchip.com>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Danil Kipnis <danil.kipnis@cloud.ionos.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Alexander Antonov <alexander.antonov@linux.intel.com>,
 Dan Murphy <dmurphy@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Achatz <erazor_de@users.sourceforge.net>, Konstantin
 Khlebnikov <koct9i@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Wu, Hao" <hao.wu@intel.com>,
 "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>, Peter
 Meerwald-Stadler <pmeerw@pmeerw.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Hanjun Guo <guohanjun@huawei.com>, Oleh
 Kravchenko <oleg@kaa.org.ua>, Lars-Peter Clausen <lars@metafoo.de>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, Saravana Kannan <saravanak@google.com>,
 Anton Vorontsov <anton@enomsg.org>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Len Brown <lenb@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oded Gabbay <oded.gabbay@gmail.com>, "Luck, Tony" <tony.luck@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Boris
 Brezillon <bbrezillon@kernel.org>,
 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jarkko
 Sakkinen <jarkko@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Heiner
 Kallweit <hkallweit1@gmail.com>, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>,
 "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jonas Meurer <jonas@freesources.org>, Daniel
 Thompson <daniel.thompson@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Mark Gross <mgross@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Kees Cook <keescook@chromium.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Kuntala,
 Kranthi" <kranthi.kuntala@intel.com>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Roman Sudarikov <roman.sudarikov@linux.intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, Russell King <linux@armlinux.org.uk>,
 =?utf-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Andrew
 Donnellan <ajd@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>,
 Chao Yu <chao@kernel.org>, Johan Hovold <johan@kernel.org>,
 Andreas Klinger <ak@it-klinger.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Asutosh Das <asutoshd@codeaurora.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
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

On 2020-10-30 8:40 AM, Mauro Carvalho Chehab wrote:
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

sysfs-bus-pci-devices-catpt changes LGTM, thanks.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com> # for catpt

Regards,
Czarek

>   Documentation/ABI/obsolete/sysfs-class-dax    |   8 +-
>   .../ABI/obsolete/sysfs-driver-hid-roccat-pyra |   3 +
>   Documentation/ABI/removed/devfs               |   1 +
>   Documentation/ABI/removed/raw1394             |   1 +
>   Documentation/ABI/removed/sysfs-class-rfkill  |   2 +-
>   Documentation/ABI/removed/video1394           |   1 +
>   Documentation/ABI/stable/firewire-cdev        |  63 ++---
>   Documentation/ABI/stable/sysfs-acpi-pmprofile |   4 +-
>   Documentation/ABI/stable/sysfs-bus-w1         |   1 +
>   Documentation/ABI/stable/sysfs-class-tpm      |   4 +-
>   Documentation/ABI/stable/sysfs-driver-speakup |   4 +
>   Documentation/ABI/testing/configfs-most       | 135 +++++++----
>   .../ABI/testing/configfs-usb-gadget-ecm       |  12 +-
>   .../ABI/testing/configfs-usb-gadget-eem       |  10 +-
>   .../ABI/testing/configfs-usb-gadget-loopback  |   6 +-
>   .../testing/configfs-usb-gadget-mass-storage  |  18 +-
>   .../ABI/testing/configfs-usb-gadget-midi      |  14 +-
>   .../ABI/testing/configfs-usb-gadget-printer   |   6 +-
>   .../testing/configfs-usb-gadget-sourcesink    |  18 +-
>   .../ABI/testing/configfs-usb-gadget-subset    |  10 +-
>   .../ABI/testing/configfs-usb-gadget-uac2      |  14 +-
>   .../ABI/testing/configfs-usb-gadget-uvc       |   2 +-
>   .../ABI/testing/debugfs-cec-error-inj         |   2 +-
>   .../ABI/testing/debugfs-driver-habanalabs     |  12 +-
>   .../ABI/testing/debugfs-pfo-nx-crypto         |  28 +--
>   Documentation/ABI/testing/debugfs-pktcdvd     |   2 +-
>   .../ABI/testing/debugfs-turris-mox-rwtm       |  10 +-
>   Documentation/ABI/testing/debugfs-wilco-ec    |  21 +-
>   Documentation/ABI/testing/dell-smbios-wmi     |  32 +--
>   Documentation/ABI/testing/gpio-cdev           |  13 +-
>   Documentation/ABI/testing/procfs-diskstats    |   6 +-
>   Documentation/ABI/testing/procfs-smaps_rollup |  48 ++--
>   Documentation/ABI/testing/pstore              |  19 +-
>   Documentation/ABI/testing/sysfs-block-rnbd    |   4 +-
>   Documentation/ABI/testing/sysfs-bus-acpi      |   1 +
>   .../testing/sysfs-bus-coresight-devices-etb10 |   5 +-
>   Documentation/ABI/testing/sysfs-bus-css       |   3 +
>   Documentation/ABI/testing/sysfs-bus-dfl       |   2 +
>   .../sysfs-bus-event_source-devices-hv_24x7    |   6 +-
>   .../sysfs-bus-event_source-devices-hv_gpci    |   7 +-
>   Documentation/ABI/testing/sysfs-bus-fcoe      |  68 ++++--
>   Documentation/ABI/testing/sysfs-bus-fsl-mc    |  12 +-
>   .../ABI/testing/sysfs-bus-i2c-devices-fsa9480 |  26 +-
>   Documentation/ABI/testing/sysfs-bus-i3c       |   2 +
>   Documentation/ABI/testing/sysfs-bus-iio       |  19 +-
>   .../ABI/testing/sysfs-bus-iio-adc-hi8435      |   5 +
>   .../ABI/testing/sysfs-bus-iio-adc-stm32       |   3 +
>   .../ABI/testing/sysfs-bus-iio-distance-srf08  |   7 +-
>   .../testing/sysfs-bus-iio-frequency-ad9523    |   2 +
>   .../testing/sysfs-bus-iio-frequency-adf4371   |  10 +-
>   .../ABI/testing/sysfs-bus-iio-health-afe440x  |  12 +-
>   .../ABI/testing/sysfs-bus-iio-light-isl29018  |   6 +-
>   .../testing/sysfs-bus-intel_th-devices-gth    |  11 +-
>   Documentation/ABI/testing/sysfs-bus-papr-pmem |  23 +-
>   Documentation/ABI/testing/sysfs-bus-pci       |  22 +-
>   .../ABI/testing/sysfs-bus-pci-devices-catpt   |   1 +
>   .../testing/sysfs-bus-pci-drivers-ehci_hcd    |   4 +-
>   Documentation/ABI/testing/sysfs-bus-rbd       |  37 ++-
>   Documentation/ABI/testing/sysfs-bus-siox      |   3 +
>   .../ABI/testing/sysfs-bus-thunderbolt         |  18 +-
>   Documentation/ABI/testing/sysfs-bus-usb       |   2 +
>   .../sysfs-class-backlight-driver-lm3533       |  26 +-
>   Documentation/ABI/testing/sysfs-class-bdi     |   1 -
>   .../ABI/testing/sysfs-class-chromeos          |  15 +-
>   Documentation/ABI/testing/sysfs-class-cxl     |   8 +-
>   Documentation/ABI/testing/sysfs-class-devlink |  30 ++-
>   Documentation/ABI/testing/sysfs-class-extcon  |  34 +--
>   .../ABI/testing/sysfs-class-fpga-manager      |   5 +-
>   Documentation/ABI/testing/sysfs-class-gnss    |   2 +
>   Documentation/ABI/testing/sysfs-class-led     |   1 +
>   .../testing/sysfs-class-led-driver-el15203000 |  30 +--
>   .../ABI/testing/sysfs-class-led-driver-lm3533 |  44 ++--
>   .../ABI/testing/sysfs-class-led-flash         |  27 ++-
>   .../testing/sysfs-class-led-trigger-netdev    |   7 +
>   .../testing/sysfs-class-led-trigger-usbport   |   1 +
>   .../ABI/testing/sysfs-class-leds-gt683r       |   8 +-
>   Documentation/ABI/testing/sysfs-class-net     |  61 +++--
>   .../ABI/testing/sysfs-class-net-cdc_ncm       |   6 +-
>   .../ABI/testing/sysfs-class-net-phydev        |   2 +
>   Documentation/ABI/testing/sysfs-class-pktcdvd |  36 +--
>   Documentation/ABI/testing/sysfs-class-power   |  12 +-
>   .../ABI/testing/sysfs-class-power-mp2629      |   1 +
>   .../ABI/testing/sysfs-class-power-twl4030     |   4 +-
>   Documentation/ABI/testing/sysfs-class-rapidio |  46 ++--
>   .../ABI/testing/sysfs-class-regulator         |  36 +--
>   .../ABI/testing/sysfs-class-remoteproc        |  14 +-
>   ...ysfs-class-rtc-rtc0-device-rtc_calibration |   1 +
>   Documentation/ABI/testing/sysfs-class-uwb_rc  |  13 +-
>   .../ABI/testing/sysfs-class-watchdog          |   7 +-
>   Documentation/ABI/testing/sysfs-dev           |   7 +-
>   .../ABI/testing/sysfs-devices-mapping         |  41 ++--
>   .../ABI/testing/sysfs-devices-memory          |  15 +-
>   .../sysfs-devices-platform-_UDC_-gadget       |  10 +-
>   .../ABI/testing/sysfs-devices-platform-ipmi   |  52 ++--
>   .../ABI/testing/sysfs-devices-system-cpu      |   4 +-
>   .../ABI/testing/sysfs-driver-hid-lenovo       |  10 +
>   .../ABI/testing/sysfs-driver-hid-ntrig        |  13 +-
>   .../ABI/testing/sysfs-driver-hid-roccat-kone  |  19 ++
>   .../ABI/testing/sysfs-driver-hid-wiimote      |   1 +
>   .../ABI/testing/sysfs-driver-input-exc3000    |   2 +
>   .../ABI/testing/sysfs-driver-jz4780-efuse     |   6 +-
>   .../ABI/testing/sysfs-driver-pciback          |   6 +-
>   Documentation/ABI/testing/sysfs-driver-ufs    | 228 ++++++++++++++----
>   .../ABI/testing/sysfs-driver-w1_ds28e17       |   3 +
>   Documentation/ABI/testing/sysfs-firmware-acpi |  16 +-
>   .../ABI/testing/sysfs-firmware-efi-esrt       |  28 ++-
>   .../testing/sysfs-firmware-efi-runtime-map    |  14 +-
>   .../ABI/testing/sysfs-firmware-qemu_fw_cfg    |  20 +-
>   Documentation/ABI/testing/sysfs-firmware-sfi  |   6 +-
>   .../ABI/testing/sysfs-firmware-sgi_uv         |   6 +-
>   Documentation/ABI/testing/sysfs-fs-f2fs       |  48 ++--
>   Documentation/ABI/testing/sysfs-kernel-mm-ksm |   5 +-
>   Documentation/ABI/testing/sysfs-kernel-slab   |   3 +
>   Documentation/ABI/testing/sysfs-module        |  17 +-
>   .../ABI/testing/sysfs-platform-dell-laptop    |  10 +-
>   .../ABI/testing/sysfs-platform-dell-smbios    |   4 +-
>   .../testing/sysfs-platform-i2c-demux-pinctrl  |   4 +-
>   Documentation/ABI/testing/sysfs-platform-kim  |   1 +
>   .../testing/sysfs-platform-phy-rcar-gen3-usb2 |  10 +-
>   .../ABI/testing/sysfs-platform-renesas_usb3   |  10 +-
>   Documentation/ABI/testing/sysfs-power         |  21 +-
>   Documentation/ABI/testing/sysfs-profiling     |   2 +-
>   Documentation/ABI/testing/sysfs-wusb_cbaf     |   3 +-
>   Documentation/ABI/testing/usb-charger-uevent  |  82 ++++---
>   Documentation/ABI/testing/usb-uevent          |  32 +--
>   scripts/get_abi.pl                            |   2 -
>   126 files changed, 1323 insertions(+), 767 deletions(-)
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
