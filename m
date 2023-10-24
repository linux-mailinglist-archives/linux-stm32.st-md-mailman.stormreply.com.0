Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B227D52BD
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Oct 2023 15:49:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0188BC6C841;
	Tue, 24 Oct 2023 13:49:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6C75C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Oct 2023 13:49:01 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qvHm2-0007R6-1x; Tue, 24 Oct 2023 15:48:46 +0200
Message-ID: <9c1c9408-88ac-4ade-b8ec-2ae5d8922cac@pengutronix.de>
Date: Tue, 24 Oct 2023 15:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Johannes Zink <j.zink@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [Linux-stm32] BUG: stmmac: Timeout accessing MAC_VLAN_Tag_Filter
 when EEE is enabled
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

Hi everyone,

for a vanilla kernel version 6.5.2 I observed the following behaviour on an 
i.MX8MP-EVK:

root@<redacted>:~# ethtool -s eth1 autoneg on speed 100 duplex full
root@<redacted>:~# ethtool --show-eee eth1
EEE settings for eth1:
         EEE status: enabled - inactive
         Tx LPI: disabled
         Supported EEE link modes:  100baseT/Full
                                    1000baseT/Full
         Advertised EEE link modes:  100baseT/Full
         Link partner advertised EEE link modes:  Not reported
root@<redacted>:~# ip link add link eth1 name eqos.5 type vlan id 5
RTNETLINK answers: Device or resource busy
root@<redacted>:~# dmesg | tail -n 1
[  819.085069] imx-dwmac 30bf0000.ethernet eth1: Timeout accessing 
MAC_VLAN_Tag_Filter
root@<redacted>:~# ip link show dev eqos.5@eth1
Device "eqos.5@eth1" does not exist.
root@<redacted>:~# ethtool --set-eee eth1 eee off
root@<redacted>:~# ethtool --show-eee eth1
EEE settings for eth1:
         EEE status: disabled
         Tx LPI: disabled
         Supported EEE link modes:  100baseT/Full
                                    1000baseT/Full
         Advertised EEE link modes:  Not reported
         Link partner advertised EEE link modes:  Not reported
root@<redacted>:~# ip link add link eth1 name eqos.5 type vlan id 5
root@<redacted>:~# ip link show dev eqos.5 

5: eqos.5@eth1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode 
DEFAULT group default qlen 1000
     link/ether 00:04:9f:07:9c:42 brd ff:ff:ff:ff:ff:ff

The same holds for removing VLANs when EEE is enabled:

(after reboot)
root@<redacted>:~# ethtool --set-eee eth1 eee off
root@<redacted>:~# ip link add link eth1 name eqos.5 type vlan id 5
root@<redacted>:~# ethtool --set-eee eth1 eee on
root@<redacted>:~# ip link del link eth1 name eqos.5 type vlan id 5
root@beluga-1311a8001168e9dc:~# dmesg | tail -n2
[  240.918085] imx-dwmac 30bf0000.ethernet eth1: Timeout accessing 
MAC_VLAN_Tag_Filter
[  240.925827] imx-dwmac 30bf0000.ethernet eth1: failed to kill vid 0081/5

Which is even a bit more concerning, because there is no error reported to 
userspace, only a netdev_err print to the kernel log

In my debugging session I found that this behaviour is only linked to EEE being 
enabled or disabled.
On 1Gbps links, the eee-broken-1000t property is set for the ethphy node, which 
is why the behaviour usually does not occur for 1GBps (which is probably the 
most common usecase).

Maybe someone on this list has more insight in the inner workings of the 
dwmac/stmmac/eqos and could point out how to fix this issue, I'd be happy to 
send patches and fix it. Also, maybe someone has other implementations at hand 
and can check if this can be reproduced

Do you deem disabling EEE while setting the VLAN up a valid workaround or 
should we rather add a warning when the timeout occurs and EEE is still enabled?

Best regards
Johannes

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
