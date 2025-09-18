Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A9B1F64B
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Aug 2025 23:17:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF5AAC36B2B;
	Sat,  9 Aug 2025 21:17:18 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 205E8C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Aug 2025 21:17:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 34234C6E;
 Sat,  9 Aug 2025 23:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754774180;
 bh=YKUqRbBCg4IcIR3LfUtI3OUi+FEwupQo1kIEtOKHlPw=;
 h=From:To:Cc:Subject:Date:From;
 b=QTxD28Xvm9k6XqO1fMf2npUkCzsfTj1EIk0Wni3m/jFtuWLXxNLvRym7JInI/VUoM
 YOI+JEBkwNbWVshkGrl0yDdx+uhewWVsc+oAzyXFZ7LF/6ZF86LpETwO72pR3GCxv8
 V6Pnj9BvyD1okEEzGosKJQ2z9S/hlb1c9SEwvN80=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Date: Sun, 10 Aug 2025 00:15:37 +0300
Message-ID: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Cc: Heiko Stuebner <heiko@sntech.de>, Devarsh Thakkar <devarsht@ti.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Erling Ljunggren <hljunggr@cisco.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Shuah Khan <skhan@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Nas Chung <nas.chung@chipsnmedia.com>,
 Andy Walls <awalls@md.metrocast.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-usb@vger.kernel.org,
 Michael Tretter <m.tretter@pengutronix.de>, Jai Luthra <jai.luthra@linux.dev>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Hans Verkuil <hans@jjverkuil.nl>, Shreeya Patel <shreeya.patel@collabora.com>,
 Ming Qian <ming.qian@nxp.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-doc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>, kernel@collabora.com,
 Ingo Molnar <mingo@kernel.org>, Matthew Majewski <mattwmajewski@gmail.com>,
 Yanteng Si <si.yanteng@linux.dev>, Magnus Damm <magnus.damm@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Dongliang Mu <dzm91@hust.edu.cn>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Mike Isely <isely@pobox.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, imx@lists.linux.dev,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@amd.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>, linux-staging@lists.linux.dev,
 Yunke Cao <yunkec@google.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jacob Chen <jacob-chen@iotwrt.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bin Liu <bin.liu@mediatek.com>,
 Akash Kumar <quic_akakum@quicinc.com>, mjpeg-users@lists.sourceforge.net,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>, Tomasz Figa <tfiga@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Tommaso Merciai <tomm.merciai@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Todor Tomov <todor.too@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, Alex Shi <alexs@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-mediatek@lists.infradead.org, Corentin Labbe <clabbe@baylibre.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>, Ma Ke <make24@iscas.ac.cn>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Benoit Parrot <bparrot@ti.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Hans Verkuil <hverkuil@kernel.org>, Yong Deng <yong.deng@magewell.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Abhishek Tamboli <abhishektamboli9@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
Subject: [Linux-stm32] [PATCH v2 00/76] media: Rationalise usage of v4l2_fh
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Hello,

This patch series refactors v4l2_fh support to make the API easier to
use, simplify drivers, and overall improve consistency through the whole
subsystem.

In V4L2, drivers that need to store per file handle data allocate their
per file handle data structure in the .open() handler and set the struct
file private_data field to point to it. The private_data field is
entirely managed by drivers, and is generally opaque to the V4L2
framework.

The V4L2 framework also needs to store per file handle data to support
features such as V4L2 events or per file handle controls. To make use of
those features, driver need to use the v4l2_fh structure to store per
file handle data, either as-is, or embedded in a driver-specific
structure. In either case, drivers must initialize the v4l2_fh structure
with v4l2_fh_init(), and set the file private_data field to point to the
v4l2_fh structure. The initialization operation sets the
V4L2_FL_USES_V4L2_FH flag in the video_device.flags field, which
indicates to the V4L2 core that private_data points to a valid v4l2_fh.

In practice, while v4l2_fh usage is optional, all V4L2 drivers make use
of it. As all new drivers are required to use v4l2_fh, this situation
will not change, and opens the door to lots of simplifications in the
V4L2 core and in drivers.

The series starts with patches 01/76 to 07/76 that align the behaviour
of all drivers, ensuring they all store a v4l2_fh pointer in the file
private_data. Seven drivers store a pointer to driver-specific
structures that embed v4l2_fh. This causes no issue in practice as the
v4l2_fh field is always the first one in all those structures, but the
code lacks coherency.

After that, the series eliminates direct access to the file
private_data. Patch 08/76 introduces a helper to retrieve the v4l2_fh
from the file, and patches 09/76 to 11/76 use the helper in drivers.

Patches 12/76 to 25/76 are assorted refactoring and cleanup that prepare
drivers to remove the last manual accesses to private_data. Patches
26/76 and 27/27 drop those, by setting private_data in the v4l2_fh_add()
helper, and resetting it to NULL in v4l2_fh_del(). Prior refactoring
makes it possible for those last two patches to be generated by
coccinelle with only small manual additions.

Patches 28/76 to 32/76 then move to simplify the V4L2 core. As all
drivers are guaranteed to use v4l2_fh, all the V4L2_FL_USES_V4L2_FH
checks can be dropped. Patch 32/76 does so. It however stops short of
dropping V4L2_FL_USES_V4L2_FH completely, and instead adds a temporary
check in the open file operation to verify that the driver uses v4l2_fh.
That check could be dropped after a few kernel releases.

The second part of the series, address a second source of inconsistent
behaviours in drivers. The V4L2 core passes to most ioctl handlers both
the file pointer and the file private_data pointer, with the latter
being passed as a void pointer. Not only is the void pointer redundant,
as driver can (and do in many cases) access the per file data from the
file private_data field, but passing a v4l2_fh through a void pointer is
error-prone as incorrect casts wouldn't be noticed by the compiler.

To fix this, patches 33/76 to 68/76 replace all usage of the void
pointer, retrieving instead the v4l2_fh from the file structure. Patches
69/76 and 70/76 then pass a NULL value through the ioctl void pointer
argument, to ensure no new driver will try to access the v4l2_fh from
there. They also rename the 'void *fh' argument to the ioctl handler
definitions to 'void *priv'.

Finally, patches 71/76 to 76/76 also rename the same arguments in
several locations:

- in the test drivers, the uvcvideo driver and the v4l2-pci-skeleton
  driver due to their role as sample and reference code (71/76 to
  73/76) ;

- in the V4L2 core (74/76) ; and

- in all drivers that use names other than the most common 'void *priv'
  and 'void *fh', in order to standardize on those two names only (75/76
  and 76/76).

Renaming all remaining 'void *fh' to 'void *priv' would be lots of
additional churn, and this series is big enough. Furthermore, we have
plans to introduce a new video_device_state argument to ioctl handlers.
We will likely remove the 'void *' argument at that time, to avoid
modifying all ioctl handlers in all drivers twice in a short amount of
time.

This series is based on a merge of the linux-media next branch, and the
"[PATCH 0/4] Remove the wl1273 FM Radio" series ([1]) applied on top of
v6.16. The dependency on the wl1273 removal is due to that driver being
the very last V4L2 driver that does not use v4l2_fh. I'm not sure yet
how that series will be merged, but technically we could also merge this
series without the dependency. It would break the wl1273 driver (at
runtime only), but that is not an issue as it's scheduled for removal
anyway.

Compared to v1, all review comments have been addressed. The most
notable changes are

- the removal of the V4L2_FL_USES_V4L2_FH checks
- the push of the NULL private pointer to the ioctl wrappers
- the reintroduction of the 'void *' parameter name in the ioctl handler
  definitions (now named 'priv'), 
- the rename of the 'void *' arguments in drivers and in the V4L2 core

Link to v1: https://lore.kernel.org/r/20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com

[1] https://lore.kernel.org/linux-media/20250625133258.78133-1-linux@treblig.org/

Jacopo Mondi (21):
  media: rcar-vin: Do not set file->private_data
  media: rzg2l-cru: Do not set file->private_data
  media: camss: Remove custom .release fop()
  media: zoran: Remove zoran_fh structure
  media: zoran: Rename __fh to fh
  media: v4l2-ioctl: Access v4l2_fh from private_data
  media: allegro: Access v4l2_fh from file
  media: meson-ge2d: Access v4l2_fh from file
  media: coda: Access v4l2_fh from file
  media: wave5: Access v4l2_fh from file
  media: m2m-deinterlace: Access v4l2_fh from file
  media: tegra-vde: Access v4l2_fh from file
  media: nxp: mx2: Access v4l2_fh from file
  media: rockhip: rga: Access v4l2_fh from file
  media: s3c-camif: Access v4l2_fh from file
  media: s5p-g2d: Access v4l2_fh from file
  media: s5p-mfc: Access v4l2_fh from file
  media: stm32: dma2d: Access v4l2_fh from file
  media: cx18: Access v4l2_fh from file
  media: usb: hdpvr: Access v4l2_fh from file
  media: usb: uvc: Access v4l2_fh from file

Laurent Pinchart (55):
  media: pci: saa7164: Store v4l2_fh pointer in file->private_data
  media: imagination: Store v4l2_fh pointer in file->private_data
  media: ti: vpe: Store v4l2_fh pointer in file->private_data
  media: usb: hdpvr: Store v4l2_fh pointer in file->private_data
  media: usb: pvrusb2: Store v4l2_fh pointer in file->private_data
  media: usb: uvcvideo: Store v4l2_fh pointer in file->private_data
  media: staging: most: Store v4l2_fh pointer in file->private_data
  media: Wrap file->private_data access with a helper function
  media: Replace file->private_data access with file_to_v4l2_fh()
  media: nvidia: tegra-vde: Replace file->private_data access
  media: Replace file->private_data access with custom functions
  media: pci: ivtv: Don't create fake v4l2_fh
  media: amphion: Make some vpu_v4l2 functions static
  media: amphion: Delete v4l2_fh synchronously in .release()
  media: visl: Drop visl_v4l2fh_to_ctx() function
  media: v4l2-fh: Move piece of documentation to correct function
  media: camss: Replace .open() file operation with v4l2_fh_open()
  media: chips-media: wave5: Pass file pointer to
    wave5_cleanup_instance()
  media: qcom: iris: Pass file pointer to iris_v4l2_fh_(de)init()
  media: qcom: iris: Set file->private_data in iris_v4l2_fh_(de)init()
  media: qcom: iris: Drop unused argument to iris_get_inst()
  media: qcom: venus: Pass file pointer to venus_close_common()
  media: Set file->private_data in v4l2_fh_add()
  media: Reset file->private_data to NULL in v4l2_fh_del()
  media: ipu6: isys: Don't set V4L2_FL_USES_V4L2_FH manually
  media: staging: ipu7: isys: Don't set V4L2_FL_USES_V4L2_FH manually
  media: v4l2-ctrls: Move v4l2_fh retrieval after V4L2_FL_USES_V4L2_FH
    check
  media: v4l2-dev: Make open and release file operations mandatory
  media: Drop V4L2_FL_USES_V4L2_FH checks
  media: mtk: jpeg: Access v4l2_fh from file->private_data
  media: mtk_mdp_m2m: Access v4l2_fh from file
  media: mtk: mdp3: Access v4l2_fh from file
  media: mtk: vcodec: Access v4l2_fh from file
  media: imx-jpeg: Access v4l2_fh from file
  media: imx-isi: Access v4l2_fh from file
  media: renesas: Access v4l2_fh from file
  media: rockchip: rkvdec: Access v4l2_fh from file
  media: exynos-gsc: Access v4l2_fh from file
  media: exynos4-is: Access v4l2_fh from file
  media: s5p-jpeg: Access v4l2_fh from file
  media: s5p-mfc: Store s5p_mfc_ctx in vb2_queue.drv_priv
  media: bdisp: Access v4l2_fh from file
  media: st: delta: Access v4l2_fh from file
  media: hantro: Access v4l2_fh from file->private_data
  media: omap3isp: Access v4l2_fh from file
  media: ivtv: Access v4l2_fh from file
  media: staging: imx: Access v4l2_fh from file
  media: v4l2-ioctl: Stop passing fh pointer to ioctl handlers
  media: v4l2-ioctl: Push NULL fh argument down to ioctl wrappers
  media: test-drivers: Rename second ioctl handlers argument to 'void
    *priv'
  media: uvcvideo: Rename second ioctl handlers argument to 'void *priv'
  media: v4l2-pci-skeleton: Rename second ioctl handlers argument to
    'void *priv'
  media: v4l2-core: Rename second ioctl handlers argument to 'void
    *priv'
  media: v4l2: Rename second ioctl handlers argument to 'void *priv'
  media: staging: Rename second ioctl handlers argument to 'void *priv'

 Documentation/driver-api/media/v4l2-fh.rst    |  59 ++-
 .../zh_CN/video4linux/v4l2-framework.txt      |  16 +-
 .../extron-da-hd-4k-plus.c                    |   4 +-
 .../media/common/videobuf2/videobuf2-v4l2.c   |  12 +-
 drivers/media/pci/bt8xx/bttv-driver.c         |  14 +-
 drivers/media/pci/bt8xx/bttv-vbi.c            |   6 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c        |  60 +--
 drivers/media/pci/cx18/cx18-driver.h          |   2 +-
 drivers/media/pci/cx18/cx18-fileops.c         |  11 +-
 drivers/media/pci/cx18/cx18-ioctl.c           |  64 +--
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |   1 -
 drivers/media/pci/ivtv/ivtv-alsa-pcm.c        |   2 -
 drivers/media/pci/ivtv/ivtv-driver.h          |   7 +-
 drivers/media/pci/ivtv/ivtv-fileops.c         |  40 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c           | 124 ++---
 drivers/media/pci/ivtv/ivtv-irq.c             |   4 +-
 drivers/media/pci/saa7134/saa7134-video.c     |   4 +-
 drivers/media/pci/saa7164/saa7164-encoder.c   |  30 +-
 drivers/media/pci/saa7164/saa7164-vbi.c       |  25 +-
 drivers/media/pci/saa7164/saa7164.h           |  10 +
 drivers/media/pci/zoran/zoran.h               |   6 -
 drivers/media/pci/zoran/zoran_driver.c        |  35 +-
 .../media/platform/allegro-dvt/allegro-core.c |  33 +-
 .../media/platform/amlogic/meson-ge2d/ge2d.c  |  25 +-
 drivers/media/platform/amphion/vpu.h          |   2 +-
 drivers/media/platform/amphion/vpu_v4l2.c     |  22 +-
 drivers/media/platform/amphion/vpu_v4l2.h     |   8 -
 .../platform/chips-media/coda/coda-common.c   |  50 +-
 .../platform/chips-media/wave5/wave5-helper.c |  10 +-
 .../platform/chips-media/wave5/wave5-helper.h |   2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         |  23 +-
 .../chips-media/wave5/wave5-vpu-enc.c         |  29 +-
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +
 .../platform/imagination/e5010-jpeg-enc.c     |  23 +-
 .../platform/imagination/e5010-jpeg-enc.h     |   5 +
 drivers/media/platform/m2m-deinterlace.c      |  26 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  37 +-
 .../media/platform/mediatek/mdp/mtk_mdp_m2m.c |  29 +-
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  25 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  36 +-
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |   9 +-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   5 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  37 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |   9 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |   4 +-
 .../media/platform/nvidia/tegra-vde/v4l2.c    |  35 +-
 drivers/media/platform/nxp/dw100/dw100.c      |   7 +-
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    |  45 +-
 drivers/media/platform/nxp/imx-pxp.c          |   7 +-
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  21 +-
 drivers/media/platform/nxp/mx2_emmaprp.c      |  24 +-
 .../media/platform/qcom/camss/camss-video.c   |  43 +-
 drivers/media/platform/qcom/iris/iris_vidc.c  |  36 +-
 drivers/media/platform/qcom/venus/core.c      |   4 +-
 drivers/media/platform/qcom/venus/core.h      |   4 +-
 drivers/media/platform/qcom/venus/vdec.c      |   5 +-
 drivers/media/platform/qcom/venus/venc.c      |   5 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |   2 -
 drivers/media/platform/renesas/rcar_fdp1.c    |  17 +-
 drivers/media/platform/renesas/rcar_jpu.c     |  27 +-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |   1 -
 .../media/platform/renesas/vsp1/vsp1_histo.c  |   6 +-
 .../media/platform/renesas/vsp1/vsp1_video.c  |  18 +-
 drivers/media/platform/rockchip/rga/rga.c     |  30 +-
 drivers/media/platform/rockchip/rga/rga.h     |   5 +
 .../media/platform/rockchip/rkvdec/rkvdec.c   |  21 +-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |   4 +-
 .../platform/samsung/exynos-gsc/gsc-core.h    |   6 +-
 .../platform/samsung/exynos-gsc/gsc-m2m.c     |  37 +-
 .../platform/samsung/exynos4-is/fimc-core.h   |   5 +-
 .../platform/samsung/exynos4-is/fimc-m2m.c    |  19 +-
 .../samsung/s3c-camif/camif-capture.c         |  26 +-
 drivers/media/platform/samsung/s5p-g2d/g2d.c  |  40 +-
 .../platform/samsung/s5p-jpeg/jpeg-core.c     |  33 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc.c  |  17 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h |   6 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_dec.c    |  34 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_enc.c    |  38 +-
 .../media/platform/st/sti/bdisp/bdisp-v4l2.c  |  30 +-
 .../media/platform/st/sti/delta/delta-v4l2.c  |  41 +-
 drivers/media/platform/st/sti/hva/hva-v4l2.c  |  38 +-
 drivers/media/platform/st/sti/hva/hva.h       |   2 -
 drivers/media/platform/st/stm32/dma2d/dma2d.c |  28 +-
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  16 +-
 .../media/platform/sunxi/sun8i-di/sun8i-di.c  |  10 +-
 .../sunxi/sun8i-rotate/sun8i_rotate.c         |  10 +-
 .../platform/synopsys/hdmirx/snps_hdmirx.c    |   8 +-
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |   2 +-
 drivers/media/platform/ti/omap/omap_vout.c    |   6 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c |  36 +-
 drivers/media/platform/ti/omap3isp/ispvideo.h |   6 +-
 drivers/media/platform/ti/vpe/vpe.c           |  21 +-
 drivers/media/platform/verisilicon/hantro.h   |   4 +-
 .../media/platform/verisilicon/hantro_drv.c   |  10 +-
 .../media/platform/verisilicon/hantro_v4l2.c  |  22 +-
 drivers/media/platform/xilinx/xilinx-dma.c    |  10 +-
 .../radio/si4713/radio-platform-si4713.c      |  10 +-
 .../media/test-drivers/vicodec/vicodec-core.c |  21 +-
 drivers/media/test-drivers/vim2m.c            |   7 +-
 .../media/test-drivers/vimc/vimc-capture.c    |   2 +-
 drivers/media/test-drivers/visl/visl-core.c   |   5 +-
 drivers/media/test-drivers/visl/visl.h        |   7 +-
 drivers/media/test-drivers/vivid/vivid-core.c | 100 ++--
 .../media/test-drivers/vivid/vivid-radio-rx.c |  12 +-
 .../media/test-drivers/vivid/vivid-radio-rx.h |   8 +-
 .../media/test-drivers/vivid/vivid-radio-tx.c |   8 +-
 .../media/test-drivers/vivid/vivid-radio-tx.h |   4 +-
 .../media/test-drivers/vivid/vivid-sdr-cap.c  |  18 +-
 .../media/test-drivers/vivid/vivid-sdr-cap.h  |  18 +-
 .../media/test-drivers/vivid/vivid-vbi-cap.c  |  10 +-
 .../media/test-drivers/vivid/vivid-vbi-cap.h  |   8 +-
 .../media/test-drivers/vivid/vivid-vbi-out.c  |   8 +-
 .../media/test-drivers/vivid/vivid-vbi-out.h  |   6 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  |  24 +-
 .../media/test-drivers/vivid/vivid-vid-cap.h  |  24 +-
 .../test-drivers/vivid/vivid-vid-common.c     |   8 +-
 .../test-drivers/vivid/vivid-vid-common.h     |   8 +-
 .../media/test-drivers/vivid/vivid-vid-out.c  |  16 +-
 .../media/test-drivers/vivid/vivid-vid-out.h  |  16 +-
 drivers/media/usb/cx231xx/cx231xx-417.c       |   2 +-
 drivers/media/usb/gspca/gspca.c               |  18 +-
 drivers/media/usb/hdpvr/hdpvr-video.c         |  69 +--
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c      |  69 +--
 drivers/media/usb/uvc/uvc_metadata.c          |  22 +-
 drivers/media/usb/uvc/uvc_v4l2.c              |  85 ++--
 drivers/media/usb/uvc/uvcvideo.h              |   5 +
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  11 +-
 drivers/media/v4l2-core/v4l2-dev.c            |  45 +-
 drivers/media/v4l2-core/v4l2-fh.c             |  16 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          | 456 +++++++++---------
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  50 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  16 +-
 .../staging/media/imx/imx-media-csc-scaler.c  |  26 +-
 drivers/staging/media/ipu7/ipu7-isys-video.c  |   1 -
 drivers/staging/media/meson/vdec/vdec.c       |  29 +-
 drivers/staging/media/meson/vdec/vdec.h       |   5 +
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   8 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   5 +
 .../staging/media/sunxi/cedrus/cedrus_video.c |   5 -
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  16 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |   6 +-
 drivers/staging/most/video/video.c            |  19 +-
 drivers/usb/gadget/function/uvc.h             |   5 +
 drivers/usb/gadget/function/uvc_v4l2.c        |   8 +-
 include/media/v4l2-ctrls.h                    |   4 +-
 include/media/v4l2-dev.h                      |   2 +-
 include/media/v4l2-fh.h                       |  28 +-
 include/media/v4l2-ioctl.h                    | 236 ++++-----
 include/media/v4l2-mem2mem.h                  |  42 +-
 samples/v4l/v4l2-pci-skeleton.c               |  10 +-
 151 files changed, 1790 insertions(+), 1804 deletions(-)


base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
