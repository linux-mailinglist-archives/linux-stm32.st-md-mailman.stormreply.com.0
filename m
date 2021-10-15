Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F6742FA07
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Oct 2021 19:22:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F17FCC5C841;
	Fri, 15 Oct 2021 17:22:26 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7EC7C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 17:22:23 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id v77so9704848oie.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UQGBuMylvu9UpPG16xaz7lVAENRpwI6V6j3bp4rN4V8=;
 b=Z32jp32n95zqUqhWkMrX4wuXD7gqEWBUoQ3lI3z+JPu9Fqs8D/TCdHv+/oKcxvuVsG
 5MY5DZtqjnWF45OCt8tP248VQrelq4DcFwkxYxGoVTrSToE2pBu0O0A0l0XVWNAN3fUG
 efgStWf1jtSTQp/PZpdavWMCawX29qpoDDGIaIRW+/soU9tgtY1BRlAkbEL0t6dhAk+t
 tWgdSnaMz4d9TWk166bIDJh2rApyQi8cTisbI8ueK6nyA3KDTjHFCzw/kI+XWq6torNd
 dg4vCsPgcBUuRrHxqxYrOPAMIheidts6ccxkhsuxY4Hl0wrvmGuY6We0/7bjZ2B5hzDW
 aRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UQGBuMylvu9UpPG16xaz7lVAENRpwI6V6j3bp4rN4V8=;
 b=qVbZ725eA6oNHrjCsczr+cCGWybtg8+74yIMDb3FHrlHSAReK7W24vj8XQyPrEL8z/
 61phnegWlnVQQj76AxHOudP5O6SJwEe43ay54QBxbQRN5QelQH4R4z1/6pMBvqqMpE3X
 bh0Jww3rgb1KoQJ5R/aSiJ4AQnsU2GHBJqdpJ2h1jvlL5QNmTPe1aQnEdwNtZGoghS3k
 ThtgTlAjWiGWuHpBSgkAlCh2b6xeygMRsDYPDliWal+Qvib1yusnk6KS3PFT2F9ic9ru
 gevKQk0EI/EF41PAIvUCTq3uIG4b8B3yZlAXuhecTcGj7SXsGq/UQWpHzd6gZjRH/Hdf
 WYdw==
X-Gm-Message-State: AOAM533/ZIBK2Z91TUpY+9+dVgziRPzXHx9kM5OuId8CQu0SC/9uMy7U
 6MUV17KyoaA61+eUyQR6z0doOw==
X-Google-Smtp-Source: ABdhPJwa8s1a0Vpv49BVQ3zzH13cErd4RoRJClmYGmIqUl6vc5OL2TMuNEsVurpHsk1CKWr2KKNkXw==
X-Received: by 2002:a05:6808:1802:: with SMTP id
 bh2mr8031298oib.142.1634318542710; 
 Fri, 15 Oct 2021 10:22:22 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id s206sm1289635oia.33.2021.10.15.10.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 10:22:22 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Date: Fri, 15 Oct 2021 12:22:12 -0500
Message-Id: <163431847249.251657.1509146684272045901.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001101234.4247-4-arnaud.pouliquen@foss.st.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stefano Stabellini <stefanos@xilinx.com>, Christoph Hellwig <hch@lst.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] (subset) [RFC PATCH 3/7] remoteproc: Remove
	vdev_to_rvdev and vdev_to_rproc from remoteproc API
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

On Fri, 1 Oct 2021 12:12:30 +0200, Arnaud Pouliquen wrote:
> These both functions are only used by the remoteproc_virtio.
> There is no reason to expose them in the API.
> Move the functions in remoteproc_virtio.c
> 
> 

Applied, thanks!

[3/7] remoteproc: Remove vdev_to_rvdev and vdev_to_rproc from remoteproc API
      commit: 9955548919c47a6987b40d90a30fd56bbc043e7b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
