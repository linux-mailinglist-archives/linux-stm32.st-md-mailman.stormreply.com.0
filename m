Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD05766167E
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Jan 2023 17:26:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6567EC65E59;
	Sun,  8 Jan 2023 16:26:00 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68DA1C65E45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Jan 2023 16:25:59 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id vm8so14576811ejc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Jan 2023 08:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xDO3sMF/hJIpyc2siGnZVm8MMtmhdSexdGimiQU1euY=;
 b=Qm58Zj7WW2E3qtJgZDyHFEqwstOpRlB6rMJe+Kocrl1AjSjY3coZXwPtmBsRTFwyik
 MlMi/2eN0/InRO0uqOzxkLtSUdogbFHmXPswZOGKVYZBc8Mho0oPVEPJ6M+WcY+T7t5Q
 lKR8azD25l7MsABWFyVipMJHuhSuwG4zLtQmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xDO3sMF/hJIpyc2siGnZVm8MMtmhdSexdGimiQU1euY=;
 b=FHpcOkiVbTElMmlWGYqm05GPofhdmdzEKOUCXp9tqK3qXhErCSmqeykGh5GuNOlH3s
 +Z167eH/3OoeQhDfggZnxuRYdzf/BSwzHm5gmdPo1XRRh1nvM0sNEyN+OtF4GHYUlj3R
 FwoWQB6WrfXRqGD8PAiGNPTP8kSnf58S9V/jVNdOpAO0bLUSIjAC5I6UZlrVTNkFTm8E
 EaXdL3FWXVUME4cmZdqq90q7xFYWsYBF2fdjdpRutt7PNFh7mNSNHKawFvGDPbIDnVP9
 BYXOY4uYGD43igYQ46aBDAXwEnQa35lnouhB484E+AK92RoJojhcpvnvbjoRJkQ4P/7D
 Rhcw==
X-Gm-Message-State: AFqh2krSf2/BCOyS98eHPZTvTaxZOKKX++v3tCb8ddeb9A22PQ75v2GM
 GsqU28Y/tU6Jyhx6D33i0PbncQ==
X-Google-Smtp-Source: AMrXdXsJsg8m07S3YqzJzCfXbR+Ag2QWqrlrLKZnp+M6SEs6flWnpeyklRXjLkOI5I96quyOeO4/Vg==
X-Received: by 2002:a17:906:9f07:b0:7ec:27d7:1838 with SMTP id
 fy7-20020a1709069f0700b007ec27d71838mr66763832ejc.22.1673195158895; 
 Sun, 08 Jan 2023 08:25:58 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-57.pool80180.interbusiness.it. [80.180.23.57])
 by smtp.gmail.com with ESMTPSA id
 n3-20020aa7c443000000b00486074b4ce4sm2659614edr.68.2023.01.08.08.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:25:58 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  8 Jan 2023 17:25:49 +0100
Message-Id: <20230108162554.8375-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wolfgang Grandegger <wg@grandegger.com>,
 devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, michael@amarulasolutions.com,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [RESEND RFC PATCH v5 0/5] can: bxcan: add support for
	ST bxCAN controller
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

The series adds support for the basic extended CAN controller (bxCAN)
found in many low- to middle-end STM32 SoCs.

The driver design (one core module and one driver module) was inspired
by other ST drivers (e. g. drivers/iio/adc/stm32-adc.c,
drivers/iio/adc/stm32-adc-core.c) where device instances share resources.
The shared resources functions are implemented in the core module, the
device driver in a separate module.

The driver has been tested on the stm32f469i-discovery board with a
kernel version 5.19.0-rc2 in loopback + silent mode:

ip link set can0 type can bitrate 125000 loopback on listen-only on
ip link set up can0
candump can0 -L &
cansend can0 300#AC.AB.AD.AE.75.49.AD.D1

For uboot and kernel compilation, as well as for rootfs creation I used
buildroot:

make stm32f469_disco_sd_defconfig
make

but I had to patch can-utils and busybox as can-utils and iproute are
not compiled for MMU-less microcotrollers. In the case of can-utils,
replacing the calls to fork() with vfork(), I was able to compile the
package with working candump and cansend applications, while in the
case of iproute, I ran into more than one problem and finally I decided
to extend busybox's ip link command for CAN-type devices. I'm still
wondering if it was really necessary, but this way I was able to test
the driver.

Changes in v5:
- Add Rob Herring's Acked-by tag.
- Add Rob Herring's Reviewed-by tag.
- Put static in front of bxcan_enable_filters() definition.

Changes in v4:
- Remove "st,stm32f4-bxcan-core" compatible. In this way the can nodes
 (compatible "st,stm32f4-bxcan") are no longer children of a parent
  node with compatible "st,stm32f4-bxcan-core".
- Add the "st,gcan" property (global can memory) to can nodes which
  references a "syscon" node containing the shared clock and memory
  addresses.
- Replace the node can@40006400 (compatible "st,stm32f4-bxcan-core")
  with the gcan@40006600 node ("sysnode" compatible). The gcan node
  contains clocks and memory addresses shared by the two can nodes
  of which it's no longer the parent.
- Add to can nodes the "st,gcan" property (global can memory) which
  references the gcan@40006600 node ("sysnode compatibble).
- Add "dt-bindings: arm: stm32: add compatible for syscon gcan node" patch.
- Drop the core driver. Thus bxcan-drv.c has been renamed to bxcan.c and
  moved to the drivers/net/can folder. The drivers/net/can/bxcan directory
  has therefore been removed.
- Use the regmap_*() functions to access the shared memory registers.
- Use spinlock to protect bxcan_rmw().
- Use 1 space, instead of tabs, in the macros definition.
- Drop clock ref-counting.
- Drop unused code.
- Drop the _SHIFT macros and use FIELD_GET()/FIELD_PREP() directly.
- Add BXCAN_ prefix to lec error codes.
- Add the macro BXCAN_RX_MB_NUM.
- Enable time triggered mode and use can_rx_offload().
- Use readx_poll_timeout() in function with timeouts.
- Loop from tail to head in bxcan_tx_isr().
- Check bits of tsr register instead of pkts variable in bxcan_tx_isr().
- Don't return from bxcan_handle_state_change() if skb/cf are NULL.
- Enable/disable the generation of the bus error interrupt depending
  on can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING.
- Don't return from bxcan_handle_bus_err() if skb is NULL.
- Drop statistics updating from bxcan_handle_bus_err().
- Add an empty line in front of 'return IRQ_HANDLED;'
- Rename bxcan_start() to bxcan_chip_start().
- Rename bxcan_stop() to bxcan_chip_stop().
- Disable all IRQs in bxcan_chip_stop().
- Rename bxcan_close() to bxcan_ndo_stop().
- Use writel instead of bxcan_rmw() to update the dlc register.

Changes in v3:
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Add description to the parent of the two child nodes.
- Move "patterProperties:" after "properties: in top level before "required".
- Add "clocks" to the "required:" list of the child nodes.
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Add "clocks" to can@0 node.
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Remove a blank line.
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Fix the documentation file path in the MAINTAINERS entry.
- Do not increment the "stats->rx_bytes" if the frame is remote.
- Remove pr_debug() call from bxcan_rmw().

Changes in v2:
- Change the file name into 'st,stm32-bxcan-core.yaml'.
- Rename compatibles:
  - st,stm32-bxcan-core -> st,stm32f4-bxcan-core
  - st,stm32-bxcan -> st,stm32f4-bxcan
- Rename master property to st,can-master.
- Remove the status property from the example.
- Put the node child properties as required.
- Remove a blank line.
- Fix sparse errors.
- Create a MAINTAINERS entry.
- Remove the print of the registers address.
- Remove the volatile keyword from bxcan_rmw().
- Use tx ring algorithm to manage tx mailboxes.
- Use can_{get|put}_echo_skb().
- Update DT properties.

Dario Binacchi (5):
  dt-bindings: arm: stm32: add compatible for syscon gcan node
  dt-bindings: net: can: add STM32 bxcan DT bindings
  ARM: dts: stm32: add CAN support on stm32f429
  ARM: dts: stm32: add pin map for CAN controller on stm32f4
  can: bxcan: add support for ST bxCAN controller

 .../bindings/arm/stm32/st,stm32-syscon.yaml   |    2 +
 .../bindings/net/can/st,stm32-bxcan.yaml      |   83 ++
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi        |   30 +
 arch/arm/boot/dts/stm32f429.dtsi              |   29 +
 drivers/net/can/Kconfig                       |   12 +
 drivers/net/can/Makefile                      |    1 +
 drivers/net/can/bxcan.c                       | 1110 +++++++++++++++++
 8 files changed, 1274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
 create mode 100644 drivers/net/can/bxcan.c

-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
