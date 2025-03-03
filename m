Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55399A4E9B8
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 18:47:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0224AC78F6A;
	Tue,  4 Mar 2025 17:47:09 +0000 (UTC)
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66D83C78F61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 17:47:07 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 20D7240D51FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 20:47:06 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6hRj1ylFzG4G7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 19:47:13 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 6A69D4274E; Tue,  4 Mar 2025 19:46:52 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=intel.com header.i=@intel.com header.b=ib8K1KKm
X-Envelope-From: <linux-kernel+bounces-541373-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=intel.com header.i=@intel.com header.b=ib8K1KKm
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id F1B434327A
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:31:50 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
 by fgw1.itu.edu.tr (Postfix) with SMTP id 822DB3063EFC
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:31:50 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2FEC3B167E
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 054631F4612;
 Mon,  3 Mar 2025 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ib8K1KKm"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3481F2380;
 Mon,  3 Mar 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740997704; cv=none;
 b=SrR5oDy9KEHZoRBJvfq3erxrZvzyjJOenzkrujxKhN1R8B2qJRImQmYwhhZuoQbm0Upkb+VKOjI+ATKQ76+DiGY+J4R//KOQygmHcA698KOwn7aphSEFBsAeO1BAiHzfTpoz/ha+Ywm6Fddb41XlzZ/Q1RPyZo7CzkmDPP2ydtg=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740997704; c=relaxed/simple;
 bh=naH9KspwalUC4SIxcxcdhcuCdSPyeBw7+LL7ZKcyavQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=CtS+hN0Akl3QMHnlz9I/CEMWEQ5+MMeX+adDksvl4xOqW5CDuoE1hb+lQJX9BiNA7V329vaW2z8X8mtA3tZv4tW8LP6xbD2P8nUl6KzOnSnc6+hFTPOv3war/YbWAmkre+z5OhJrl9jhUOViTENdWGcVYVuyok59/V0EUm0zIhI=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b=ib8K1KKm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740997703; x=1772533703;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=naH9KspwalUC4SIxcxcdhcuCdSPyeBw7+LL7ZKcyavQ=;
 b=ib8K1KKmZHBkCl8J4dcdi0vDFYoFdmwD7535Z8CoHYHgqiIaHknlLu1Z
 jee3/IwNpgJStDmrf3kSQyCMuCGPhUBsh0LsTfO9UFejgIoySJvj3xMfV
 cbSB6qqhtlP0nJBcF72JrFormj7WMhYgkGrsqIVcnCJcdeTEA4UW+SyKD
 t9b5ZmY/s7RmBkdU8IZ4CvKZ4oTGWzmxLQ2+2yPTXyXLuE5/0JfbEOBwk
 xby8NVA+LoZ0vGP+DkO30hWaUS/wJBmqVplMl69CdIDhRHKQ/c5SS3wql
 EUMPHjz8tHSnJEwQIOVFe5KUurrj588ofCRvXc3aev8/3dAcGl6qwYLdV w==;
X-CSE-ConnectionGUID: GLlEkOCuSe2ShOnFc6/21A==
X-CSE-MsgGUID: BsGU7BGyRH+fAJ/ZpVkN9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="64310253"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="64310253"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 02:28:23 -0800
X-CSE-ConnectionGUID: w4pCy+ifSdmjYRxSLDAKCw==
X-CSE-MsgGUID: WMXFEbW1SyugSAw2veHtzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="122569912"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
 by fmviesa005.fm.intel.com with ESMTP; 03 Mar 2025 02:28:15 -0800
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Mon,  3 Mar 2025 05:26:56 -0500
Message-Id: <20250303102658.3580232-8-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303102658.3580232-1-faizal.abdul.rahim@linux.intel.com>
References: <20250303102658.3580232-1-faizal.abdul.rahim@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6hRj1ylFzG4G7
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741715114.65102@PMiqLl5q6qy9Gmtje3//6w
X-ITU-MailScanner-SpamCheck: not spam
Subject: [Linux-stm32] [PATCH iwl-next v7 7/9] igc: Block setting
	preemptible traffic class in taprio
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
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

Since preemptible tc implementation is not ready yet, block it from being
set in taprio. The existing code already blocks it in mqprio.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index fc086919387c..319eeb5b0a54 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -6407,6 +6407,10 @@ static int igc_save_qbv_schedule(struct igc_adapter *adapter,
 	if (!validate_schedule(adapter, qopt))
 		return -EINVAL;
 
+	/* preemptible isn't supported yet */
+	if (qopt->mqprio.preemptible_tcs)
+		return -EOPNOTSUPP;
+
 	igc_ptp_read(adapter, &now);
 
 	if (igc_tsn_is_taprio_activated_by_user(adapter) &&
-- 
2.34.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
