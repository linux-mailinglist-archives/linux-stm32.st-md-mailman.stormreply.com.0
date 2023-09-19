Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C83647A5885
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 06:49:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F548C6B477;
	Tue, 19 Sep 2023 04:49:21 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with SMTP id 91520C6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 04:49:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 8907F602F96E1;
 Tue, 19 Sep 2023 12:48:57 +0800 (CST)
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Wu Yunchuan <yunchuan@nfschina.com>
To: kvalo@kernel.org, quic_jjohnson@quicinc.com, jirislaby@kernel.org,
 mickflemm@gmail.com, mcgrof@kernel.org, toke@toke.dk, afaerber@suse.de,
 mani@kernel.org, chunkeey@googlemail.com, loic.poulain@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Tue, 19 Sep 2023 12:48:33 +0800
Message-Id: <20230919044832.522947-1-yunchuan@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, syoshida@redhat.com,
 johannes.berg@intel.com, ath12k@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, alexander@wetzel-home.de,
 Wu Yunchuan <yunchuan@nfschina.com>, wcn36xx@lists.infradead.org,
 ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 wireless-next 0/9] Remove unnecessary
	(void*) conversions
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

Remove all unnecessary (void*) conversions under the directory drivers/net/wireless/ath.

Changes in v2:
 - fix file path error in v1 patch 
 - change the prototype to remove the local variable(Jeff Johnson's suggestion.)[1]

[1] https://lore.kernel.org/all/5bb164e7-c147-64d1-031d-0ba20cfffa77@nfschina.com/

Wu Yunchuan (9):
  wifi: ar5523: Remove unnecessary (void*) conversions
  carl9170: remove unnecessary (void*) conversions
  wifi: wcn36xx: remove unnecessary (void*) conversions
  wifi: ath5k: remove unnecessary (void*) conversions
  ath6kl: remove unnecessary (void*) conversions
  wifi: ath10k: Remove unnecessary (void*) conversions
  wifi: ath12k: Remove unnecessary (void*) conversions
  wifi: ath11k: remove unnecessary (void*) conversions
  wifi: ath9k: Remove unnecessary (void*) conversions

 drivers/net/wireless/ath/ar5523/ar5523.c      |  2 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c      | 16 ++++-----
 drivers/net/wireless/ath/ath11k/dp.c          |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c       | 13 +++----
 drivers/net/wireless/ath/ath11k/hal.c         |  8 ++---
 drivers/net/wireless/ath/ath11k/hal_rx.c      | 17 ++++-----
 drivers/net/wireless/ath/ath11k/hal_tx.c      |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c         |  4 +--
 drivers/net/wireless/ath/ath11k/spectral.c    |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c         |  6 ++--
 drivers/net/wireless/ath/ath12k/dp_mon.c      |  9 ++---
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c       |  5 ++-
 drivers/net/wireless/ath/ath5k/base.c         |  4 +--
 drivers/net/wireless/ath/ath5k/pci.c          |  4 +--
 drivers/net/wireless/ath/ath6kl/main.c        |  4 +--
 drivers/net/wireless/ath/ath6kl/txrx.c        |  2 +-
 .../wireless/ath/ath9k/ath9k_pci_owl_loader.c |  2 +-
 drivers/net/wireless/ath/ath9k/common-init.c  |  2 +-
 .../net/wireless/ath/ath9k/common-spectral.c  |  2 +-
 drivers/net/wireless/ath/ath9k/debug.c        |  2 +-
 drivers/net/wireless/ath/ath9k/hif_usb.c      | 10 +++---
 .../net/wireless/ath/ath9k/htc_drv_debug.c    |  2 +-
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 36 +++++++++----------
 drivers/net/wireless/ath/ath9k/htc_hst.c      |  2 +-
 drivers/net/wireless/ath/ath9k/init.c         | 12 +++----
 drivers/net/wireless/ath/ath9k/link.c         |  2 +-
 drivers/net/wireless/ath/ath9k/pci.c          |  6 ++--
 drivers/net/wireless/ath/carl9170/usb.c       | 10 +++---
 drivers/net/wireless/ath/wcn36xx/dxe.c        |  6 ++--
 drivers/net/wireless/ath/wcn36xx/smd.c        | 20 +++++------
 drivers/net/wireless/ath/wcn36xx/testmode.c   |  2 +-
 32 files changed, 101 insertions(+), 117 deletions(-)

-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
