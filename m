Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A696D1C7F
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2019 01:10:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05AEFC36B0C;
	Wed,  9 Oct 2019 23:10:35 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D018FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 23:10:33 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id y144so3838617qkb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Oct 2019 16:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=PnjQOHepBuv9rYKnDUFewaU2wDCjjihpShjTxB7TXsk=;
 b=RsKHCYwlEK2MnPGOLw3WfXus/DDmivqcNdxalAOy3hlZ/qAQSBLq1JTB/kxeHQl1W3
 fEwIP+vV4b7VINYF3fxCLVX+ZDMkWBpk33nzXxBQmUpj4mWuG2L1jy25vxDQhUPJNWnI
 OLb2oVqDMOyZgZQyDg6NrudDbB/NlkOEj+xKnjOlzXp1VGahGeHGqixJ8EuWEWwbe/id
 YlS1JRQZpPp/HilLmm9nFyT5AF3dNB/7dQo58dqWYl5hSu2X7bxBDOVqcajUu1Et5uAU
 UjiSceUeTP8BfdtMBu2nPvkOfXRv/+k5TJe551yvWspUt8b5fhRsLOf6cs+3Uwk4mvNl
 hK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=PnjQOHepBuv9rYKnDUFewaU2wDCjjihpShjTxB7TXsk=;
 b=uTZarBVApwMYVfhpRtQ+B2OuiyUaQQR1OBVCoaQyvNa53PiIMEG6w6vw4F/F7qgfvs
 IykBaOk8dE12pWJuUqrLQ2wsUsNbDDTtmkkPKby5E4ZAaNUDEKqEebsvxK2yt4gvCjVd
 LK42qyuBvhBoDmEXV5iMRz1ooZL/iAugwLdQHUVde64QjTQfi/t+BB0Cr3Pm2A7t9eNZ
 p4HuRSiglEdB2fUlkUDxCihHnbaSlvZAg77xOUQQWBX/4tDMpzyGCPEPN1GyODaw8x2u
 PThq+OdBr9NE3jX8bGzKS2fPRj0rmnZizjc4XEuEEkSAHvJO9BOMamT8/VKd7vL/KN+j
 ZGcQ==
X-Gm-Message-State: APjAAAXmkzm4GSkjsbAmjgMJlnGZtHBYgB2DvqRIHu2XPphPihCgt2fe
 Tnji1IrlQIA5i6N72r4l/msHjA==
X-Google-Smtp-Source: APXvYqzDsg7VvPjwvTLuHucNP0B1UJPXSz1g9Ec4z5pbH0OhF3aJ6PEN0n9s/5rnpedoNj2WEr1nyw==
X-Received: by 2002:a05:620a:1355:: with SMTP id
 c21mr6444676qkl.288.1570662632760; 
 Wed, 09 Oct 2019 16:10:32 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id m186sm1709799qkb.88.2019.10.09.16.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 16:10:32 -0700 (PDT)
Date: Wed, 9 Oct 2019 16:10:18 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20191009161018.3b4919cd@cakuba.netronome.com>
In-Reply-To: <20191007154306.95827-3-antonio.borneo@st.com>
References: <20191007154306.95827-1-antonio.borneo@st.com>
 <20191007154306.95827-3-antonio.borneo@st.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix length of PTP clock's
	name string
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

On Mon, 7 Oct 2019 17:43:04 +0200, Antonio Borneo wrote:
> The field "name" in struct ptp_clock_info has a fixed size of 16
> chars and is used as zero terminated string by clock_name_show()
> in drivers/ptp/ptp_sysfs.c
> The current initialization value requires 17 chars to fit also the
> null termination, and this causes overflow to the next bytes in
> the struct when the string is read as null terminated:
> 	hexdump -C /sys/class/ptp/ptp0/clock_name
> 	00000000  73 74 6d 6d 61 63 5f 70  74 70 5f 63 6c 6f 63 6b  |stmmac_ptp_clock|
> 	00000010  a0 ac b9 03 0a                                    |.....|
> where the extra 4 bytes (excluding the newline) after the string
> represent the integer 0x03b9aca0 = 62500000 assigned to the field
> "max_adj" that follows "name" in the same struct.
> 
> There is no strict requirement for the "name" content and in the
> comment in ptp_clock_kernel.h it's reported it should just be 'A
> short "friendly name" to identify the clock'.
> Replace it with "stmmac ptp".
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")

Applied to net, queued for stable.

For future submissions please indicate the target tree. Networking fixes
should go to the net tree and have [PATCH net] in the subject, while
normal patches such as new features and clean ups should be tagged as
[PATCH net-next].
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
