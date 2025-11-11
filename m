Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED061C5190A
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 11:09:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EF5DC628D5;
	Wed, 12 Nov 2025 10:09:32 +0000 (UTC)
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1DE4C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 09:30:08 +0000 (UTC)
X-CSE-ConnectionGUID: E3I0E2d4TqSO7bwA5HLWIA==
X-CSE-MsgGUID: frTPyOc3SIakwotc26WU2g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2025 18:30:05 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.46])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7D2904172C38;
 Tue, 11 Nov 2025 18:30:01 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, boon.khai.ng@altera.com
Date: Tue, 11 Nov 2025 09:29:58 +0000
Message-ID: <20251111093000.58094-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Nov 2025 10:09:31 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: Disable EEE RX
	clock stop when VLAN is enabled
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

Hi,

This series fixes a couple of VLAN issues observed on the Renesas RZ/V2H
EVK platform (stmmac + Microchip KSZ9131RNXI PHY):

- The first patch fixes a bug where VLAN ID 0 would not be properly removed
due to how vlan_del_hw_rx_fltr() matched entries in the VLAN filter table.

- The second patch addresses RX clock gating issues that occur during VLAN
creation and deletion when EEE is enabled with RX clock-stop active (the
default configuration). For example:

    # ip link add link end1 name end1.5 type vlan id 5
    15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
    RTNETLINK answers: Device or resource busy

The stmmac hardware requires the receive clock to be running when writing
certain registers, including VLAN registers. However, by default the driver
enables Energy Efficient Ethernet (EEE) and allows the PHY to stop the
receive clock when the link is idle. As a result, the RX clock might be
stopped when attempting to access these registers, leading to timeouts.

A more comprehensive overview of receive clock related issues in the
stmmac driver can be found here:
https://lore.kernel.org/all/Z9ySeo61VYTClIJJ@shell.armlinux.org.uk/

Most of the issues were resolved by commit dd557266cf5fb ("net: stmmac:
block PHY RXC clock-stop"), which wraps register accesses with
phylink_rx_clk_stop_block()/unblock() calls. However, VLAN add/delete
operations are invoked with bottom halves disabled, where sleeping is
not permitted, so those helpers cannot be used.

To avoid these VLAN timeouts, the second patch disables the EEE RX
clock-stop feature when VLAN support is enabled. This ensures the receive
clock remains active, allowing VLAN operations to complete successfully.

Best regards,
Ovidiu

Ovidiu Panait (2):
  net: stmmac: Fix VLAN 0 deletion in vlan_del_hw_rx_fltr()
  net: stmmac: Disable EEE RX clock stop when VLAN is enabled

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
