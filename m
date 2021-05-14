Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFA1382BCC
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 14:08:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1F21C59784;
	Mon, 17 May 2021 12:08:34 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99D79C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 18:41:15 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id b25so111899eju.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 11:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gPu3JhIKExQczwKARwj2go99YLQAcb+tX8q8d0+CLrs=;
 b=NNOJPMvZs5apsCsSxnRrS7Oif613DF+Ig4RR8vsr/9kZnIWzIw0octczCfKy0zhgmV
 HwZ7r1gChNH7o3xQyA45Ud3rbNOmMF+JmtFfSoYaKTyGM59xIm56DmNBAIF0JwT0GCve
 NWptBOtaDHhbKBBA+7GjMIX2/yOhmcaUtGSq5NpjUJObH+Cl40qAbdTMM0gWlIjx0AQ+
 P+k5x1DjdFDREnFFzUB92Nts9oiFPg3eR2HyEPSsincUNGmMCUQkGzLJM701aQ/xYMhV
 hTDj4+sWtWrRX5l78E49JdJ2hrYbDQ6DZOhKmNMFo7VkLyhtCbWmAwERGC1tqIkZ0xC/
 i9uQ==
X-Gm-Message-State: AOAM5337XEFufp+PKCRymVhUG+bP3Edn3y+TmGPuiE8XTPNpHN62suaw
 t9uF+sq8YGEijdy156v0LC8=
X-Google-Smtp-Source: ABdhPJw/bzz+edLEyA47WDc1rrEAXftvdXlwn8/p6LzoZoO4/o+QryD11sVkSt7P+ExsEP3oTa1Mxg==
X-Received: by 2002:a17:906:6a93:: with SMTP id
 p19mr50865392ejr.319.1621017675225; 
 Fri, 14 May 2021 11:41:15 -0700 (PDT)
Received: from turbo.teknoraver.net (net-5-94-253-60.cust.vodafonedsl.it.
 [5.94.253.60])
 by smtp.gmail.com with ESMTPSA id dj17sm5081505edb.7.2021.05.14.11.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:41:14 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Fri, 14 May 2021 20:39:54 +0200
Message-Id: <20210514183954.7129-4-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514183954.7129-1-mcroce@linux.microsoft.com>
References: <20210514183954.7129-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 May 2021 12:08:30 +0000
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 3/3] vhost_net: use XDP helpers
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

From: Matteo Croce <mcroce@microsoft.com>

Make use of the xdp_{init,prepare}_buff() helpers instead of
an open-coded version.

Also, the field xdp->rxq was never set, so pass NULL to xdp_init_buff()
to clear it.

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 drivers/vhost/net.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index df82b124170e..6414bd5741b8 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -744,11 +744,9 @@ static int vhost_net_build_xdp(struct vhost_net_virtqueue *nvq,
 	if (copied != len)
 		return -EFAULT;
 
-	xdp->data_hard_start = buf;
-	xdp->data = buf + pad;
-	xdp->data_end = xdp->data + len;
+	xdp_init_buff(xdp, buflen, NULL);
+	xdp_prepare_buff(xdp, buf, pad, len, true);
 	hdr->buflen = buflen;
-	xdp->frame_sz = buflen;
 
 	--net->refcnt_bias;
 	alloc_frag->offset += buflen;
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
