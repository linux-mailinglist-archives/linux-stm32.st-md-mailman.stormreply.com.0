Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A7D3828BB
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 11:48:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CC93C57B75;
	Mon, 17 May 2021 09:48:37 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE592C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 May 2021 09:48:35 +0000 (UTC)
IronPort-SDR: 1M9YDyrAuiKqkriAGt7N/yNmOk7EO4Xn2G1ZwiLFaI4KUdltncVcnhYL5NcMZLlteJNchr6oam
 HxT7wKoWo2fw==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="197344769"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="197344769"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 02:48:33 -0700
IronPort-SDR: BtMZeH5xv+CEdiQruJx2fAA9YSh2lB5octWCZn2VKPrz0BtrG/Rzd0FlZF1u9p6gPLMT7qdW//
 DWvsCgc6r2Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="540355990"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga001.fm.intel.com with ESMTP; 17 May 2021 02:48:29 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, kuba@kernel.org, netdev@vger.kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, weifeng.voon@intel.com,
 boon.leong.ong@intel.com, tee.min.tan@intel.com,
 vee.khee.wong@linux.intel.com, vee.khee.wong@intel.com,
 michael.wei.hong.sit@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 17 May 2021 17:43:30 +0800
Message-Id: <20210517094332.24976-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [Linux-stm32] [PATCH net-next 0/2] Introducing support for DWC xpcs
	Energy Efficient Ethernet
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The goal of this patch set is to enable EEE in the xpcs so that when
EEE is enabled, the MAC-->xpcs-->PHY have all the EEE related
configurations enabled.

Patch 1 adds the functions to enable EEE in the xpcs and sets it to
transparent mode.
Patch 2 adds the callbacks to configure the xpcs EEE mode.

The results are tested by checking the lpi counters of the tx and rx
path of the interface. When EEE is enabled, the lpi counters should
increament as it enters and exits lpi states.

host@EHL$ ethtool --show-eee enp0s30f4
EEE Settings for enp0s30f4:
        EEE status: disabled
        Tx LPI: disabled
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
        Advertised EEE link modes:  Not reported
        Link partner advertised EEE link modes:  100baseT/Full
                                                 1000baseT/Full
host@EHL$ ethtool -S enp0s30f4 | grep lpi
     irq_tx_path_in_lpi_mode_n: 0
     irq_tx_path_exit_lpi_mode_n: 0
     irq_rx_path_in_lpi_mode_n: 0
     irq_rx_path_exit_lpi_mode_n: 0
host@EHL$ ethtool --set-eee enp0s30f4 eee on
host@EHL$ [  110.265154] intel-eth-pci 0000:00:1e.4 enp0s30f4: Link is Down
[  112.315155] intel-eth-pci 0000:00:1e.4 enp0s30f4: Link is Up - 1Gbps/Full - flow control off
[  112.324612] IPv6: ADDRCONF(NETDEV_CHANGE): enp0s30f4: link becomes ready
host@EHL$ ethtool --show-eee enp0s30f4
EEE Settings for enp0s30f4:
        EEE status: enabled - active
        Tx LPI: 1000000 (us)
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
        Advertised EEE link modes:  100baseT/Full
                                    1000baseT/Full
        Link partner advertised EEE link modes:  100baseT/Full
                                                 1000baseT/Full
host@EHL$ ethtool -S enp0s30f4 | grep lpi
     irq_tx_path_in_lpi_mode_n: 6
     irq_tx_path_exit_lpi_mode_n: 5
     irq_rx_path_in_lpi_mode_n: 7
     irq_rx_path_exit_lpi_mode_n: 6
host@EHL$ ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
64 bytes from 192.168.1.1: icmp_seq=1 ttl=64 time=1.02 ms
64 bytes from 192.168.1.1: icmp_seq=2 ttl=64 time=0.510 ms
64 bytes from 192.168.1.1: icmp_seq=3 ttl=64 time=0.489 ms
64 bytes from 192.168.1.1: icmp_seq=4 ttl=64 time=0.484 ms
64 bytes from 192.168.1.1: icmp_seq=5 ttl=64 time=0.504 ms
64 bytes from 192.168.1.1: icmp_seq=6 ttl=64 time=0.466 ms
64 bytes from 192.168.1.1: icmp_seq=7 ttl=64 time=0.529 ms
64 bytes from 192.168.1.1: icmp_seq=8 ttl=64 time=0.519 ms
64 bytes from 192.168.1.1: icmp_seq=9 ttl=64 time=0.518 ms
64 bytes from 192.168.1.1: icmp_seq=10 ttl=64 time=0.501 ms

--- 192.168.1.1 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9216ms
rtt min/avg/max/mdev = 0.466/0.553/1.018/0.155 ms
host@EHL$ ethtool -S enp0s30f4 | grep lpi
     irq_tx_path_in_lpi_mode_n: 22
     irq_tx_path_exit_lpi_mode_n: 21
     irq_rx_path_in_lpi_mode_n: 21
     irq_rx_path_exit_lpi_mode_n: 20

Michael Sit Wei Hong (2):
  net: pcs: Introducing support for DWC xpcs Energy Efficient Ethernet
  net: stmmac: Add callbacks for DWC xpcs Energy Efficient Ethernet

 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 11 ++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  2 +
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  6 +++
 drivers/net/pcs/pcs-xpcs.c                    | 51 +++++++++++++++++++
 include/linux/pcs/pcs-xpcs.h                  |  2 +
 include/linux/stmmac.h                        |  1 +
 6 files changed, 73 insertions(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
