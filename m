Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0852AA4B4
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Nov 2020 12:36:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3647BC3FAD4;
	Sat,  7 Nov 2020 11:36:05 +0000 (UTC)
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7843CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Nov 2020 11:35:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604748962; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=tprYRfhJAGs+dRGMRvpWISe7Mh6nCJ9stashzLxk+jo=;
 b=Uz2PWZpZWajU1WHPr5L20gfXYSRrOPLbuvyfDeUpyIdExSEKiJ8y6LvN4+AqOQl4zXAPizeQ
 WVa4fsmOm5xkiZ9LeXHHIxpm6aKCSUqiDR6+QUQM+6xRV5Hem6qDFgCfQg5w0tXtTV9iLV59
 3uPf1hA5DNUvj1NFohM8rX5uBfY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1Njk0YyIsICJsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fa6866151f9d6623ffccbc0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 07 Nov 2020 11:34:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 98EB5C4339C; Sat,  7 Nov 2020 11:34:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 MISSING_DATE,MISSING_MID,SPF_FAIL autolearn=no autolearn_force=no
 version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 544D9C433C8;
 Sat,  7 Nov 2020 11:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 544D9C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201020125841.26791-1-trix@redhat.com>
References: <20201020125841.26791-1-trix@redhat.com>
To: trix@redhat.com
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201107113456.98EB5C4339C@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 11:34:56 +0000 (UTC)
Cc: emmanuel.grumbach@intel.com, tova.mussai@intel.com,
 Tom Rix <trix@redhat.com>, ath9k-devel@qca.qualcomm.com,
 saurav.girepunje@gmail.com, luciano.coelho@intel.com,
 shahar.s.matityahu@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 shaul.triebitz@intel.com, lior2.cohen@intel.com, pkshih@realtek.com,
 ath10k@lists.infradead.org, kuba@kernel.org, johannes.berg@intel.com,
 linuxwifi@intel.com, sara.sharon@intel.com, linux-kernel@vger.kernel.org,
 christophe.jaillet@wanadoo.fr, john@phrozen.org,
 linux-arm-kernel@lists.infradead.org, yanaijie@huawei.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, gustavoars@kernel.org,
 nathan.errera@intel.com, zhengbin13@huawei.com, mcoquelin.stm32@gmail.com,
 joe@perches.com, davem@davemloft.net, Larry.Finger@lwfinger.net
Subject: Re: [Linux-stm32] [PATCH v2] wireless: remove unneeded break
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

trix@redhat.com wrote:

> From: Tom Rix <trix@redhat.com>
> 
> A break is not needed if it is preceded by a return
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Patch applied to wireless-drivers-next.git, thanks.

3287953b0399 wireless: remove unneeded break

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201020125841.26791-1-trix@redhat.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
