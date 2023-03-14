Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6A86B9406
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 13:40:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0C06C65E60;
	Tue, 14 Mar 2023 12:40:27 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01D3EC64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 12:40:25 +0000 (UTC)
Received: from maxwell.localdomain ([109.43.51.107]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mwfj2-1qRHkW3Auw-00y8gt; Tue, 14 Mar 2023 13:39:39 +0100
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: netdev@vger.kernel.org
Date: Tue, 14 Mar 2023 13:37:57 +0100
Message-Id: <20230314123759.132521-1-jh@henneberg-systemdesign.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:nirRWSK/2cPq72undNtjfDp90mDVAAXSn8jLqo9gwzdQIrM76dA
 IVIXDerUHw9J/dLbyoAkjYTSwMFHCQwtMtbJvbi3tGCofoPSvM2MbeYnwS9ZnmamQ3WGZIE
 Wa6FEvvhVLvzFqNljBX94bIN+zxPaBwckA5zP/HH3U/k9NjQyXHWbLuatE5vsWZW04cnnkv
 GyMU5qadNKpk6kXiFGC0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sUckAPOkw98=;PDZ0zTqeiARJq7sB6acZmZhoo/H
 xYgY5WFfkAgHVZ1PS/rc7PFXdecHiQ5dx6wVy8s3znWf3nym7UX4aXYTmmqXWL50jX15/0iw0
 GLNN0x1QvsBYvdmHKXmpkD9MINLH71Jfiio1CmQaC5Ds2+3LOgf4aM2o/DA7uus/iSkSKvN6R
 Gn6KWfv1rABLi62nKT/XZ31E5gD2Byob6gNXWuNbGCZcOjW3GST9KeCPzV1cmTeXaPlWX2MsJ
 JSvI3wt4BihBv5EqNGLbbJIgI0RbIgdlDuOqzjqBbSmzdF3Y6xkIEc52Uxlf8nIBSBQaYzbl2
 RW+0/AQQVzAi9ebph9gAORyTMG4DZOabkPDByAjepDFgiu9TKT+LVG27TNiOUgPMcXUAmRviy
 pr74TdoWnZKj3YPvGRV7gLDHotkP96/mnBgAfUsiznatYXGP6oLSTBhS/JNeL6Fzi9j6mvIjD
 /Ygg90IE3GVDsgFLfTciR+2a58JXHIdkehMFfBE4UW8j41csl/ImcMfhw0EaUXJhrhdzg5yDj
 tmTe4vNf2/VRwFE8qi6z3s+2owRTWYzke2O2/2iZE8pBtFTv4kgGRlamczsplEiBUgExAqEt/
 ivprnKNjtNhtgy2WVdvNZ6vKXb5khLMO/VD9pg641Qppcopiyv97tsLkVB/S/pKQ8naRkHOVa
 pvgZ5QWCgZ59CA0IMkwv9oI8QNlkIikiw2Lsutb2nA==
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/2] net: stmmac: Premature loop
	termination check was ignored
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

As proposed in [1] here is are the fixes as a patch series that do the
premature end-of-loop check within the goto loop.

Jochen Henneberg (2):
  net: stmmac: Premature loop termination check was ignored
  net: stmmac: Premature loop termination check was ignored

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

[1] https://lore.kernel.org/all/Y%2FdiTAg2iUopr%2FOy@corigine.com/
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
