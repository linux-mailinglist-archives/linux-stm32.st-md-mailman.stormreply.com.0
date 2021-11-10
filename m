Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A844C469
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 16:31:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF053C5EC71;
	Wed, 10 Nov 2021 15:31:52 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CB14C5EC6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 15:31:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.87,224,1631545200"; d="scan'208";a="99810480"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 11 Nov 2021 00:31:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 37F7F40065AE;
 Thu, 11 Nov 2021 00:31:45 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 10 Nov 2021 15:31:39 +0000
Message-Id: <20211110153142.3451-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] Add RZ/G2L OSTM support
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

This patch series aims to add Generic Timer Module (a.k.a OSTM) support
for RZ/G2L series.

OSTM modules needs to deassert the reset line before accessing
any registers.

v1->v2:
 * Added of_reset_control_get_optional_exclusive API
 * Updated dt-bindings to use renesas,ostm
 * Added reset handling in ostm_init

Biju Das (3):
  reset: Add of_reset_control_get_optional_exclusive()
  dt-bindings: timer: renesas: ostm: Document Renesas RZ/G2L OSTM
  clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support

 .../bindings/timer/renesas,ostm.yaml          | 20 ++++++++--
 drivers/clocksource/renesas-ostm.c            | 37 ++++++++++++++++++-
 include/linux/reset.h                         | 20 ++++++++++
 3 files changed, 73 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
