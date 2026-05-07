Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MxQNtBN/GlOOAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 10:31:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9654E4D45
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 10:31:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AF48C8F289;
	Thu,  7 May 2026 08:31:10 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [207.46.229.174])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F160DC87ECE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 08:31:08 +0000 (UTC)
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
 by app2 (Coremail) with SMTP id TQJkCgBHXqG0Tfxps3kXAA--.38748S2;
 Thu, 07 May 2026 16:30:45 +0800 (CST)
From: lizhi2@eswincomputing.com
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu,  7 May 2026 16:30:36 +0800
Message-ID: <20260507083037.152-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgBHXqG0Tfxps3kXAA--.38748S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur47uFy3Kw4UAr1UCF4UArb_yoW8Kryxpa
 95Kr15t340qFyxGwn2vF1Iqa4rXay8Ga15Cr1rXr95Z3Z8CF9Yyr1xKw4DuFy7Ar4xZF1Y
 vryjq3Z8Ca4qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRkwIhUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
Cc: pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com,
 linmin@eswincomputing.com, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, Zhi Li <lizhi2@eswincomputing.com>
Subject: [Linux-stm32] [PATCH net v1 0/2] net: stmmac: eic7700: fix delay
	calculation and initialization ordering
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
X-Rspamd-Queue-Id: 6E9654E4D45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[eswincomputing.com];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:weishangjuan@eswincomputing.com,m:linmin@eswincomputing.com,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:lizhi2@eswincomputing.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Zhi Li <lizhi2@eswincomputing.com>

This series fixes several issues in the EIC7700 DWMAC glue driver
affecting existing eth0 functionality due to incorrect delay programming
and initialization ordering.

The previous implementation used an incorrect delay step (100 ps),
while the hardware operates with 20 ps granularity. This resulted in
incorrect programming of RX/TX delay values relative to the actual
hardware timing model.

In addition, the driver did not guarantee that clocks were enabled
before accessing HSP CSR registers, and did not explicitly clear
TXD/RXD delay registers, which may leave residual configuration from
the bootloader and affect RGMII timing determinism.

The device tree binding is updated to reflect the actual hardware delay
model and to clarify the semantics of MAC-side delay configuration,
aligning it with the real programming model without changing the
intended semantic meaning of the properties.

Changes in this series:
  - Correct delay step from 100 ps to 20 ps and validate input range
  - Ensure clocks are enabled before CSR access
  - Clear TXD/RXD delay registers during initialization
  - Update dt-binding to use range-based constraints (0-2540 ps, 20 ps step)
  - Make delay properties optional depending on RGMII mode
  - Clarify MAC-side delay semantics in binding documentation

These changes correct eth0 behavior and hardware programming correctness
for existing usage.

The previous revisions (v1-v7) mixed bug fixes and new functionality.
Based on review feedback, the changes are now split, and this series
contains only fixes targeting the net tree. Eth1 enablement will be
submitted separately to net-next.

Previous discussion:
  https://lore.kernel.org/lkml/20260427072353.1114-1-lizhi2@eswincomputing.com/

This binding update is safe as there are currently no in-tree users
relying on the previous enum-based representation.

Zhi Li (2):
  dt-bindings: ethernet: eswin: refine delay model and HSP register
    description
  net: stmmac: eic7700: fix delay step calculation and ensure safe
    register initialization

 .../bindings/net/eswin,eic7700-eth.yaml       |  50 ++++--
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 154 +++++++++++++-----
 2 files changed, 148 insertions(+), 56 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
