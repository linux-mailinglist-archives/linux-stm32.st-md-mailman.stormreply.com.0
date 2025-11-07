Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC0C3E37B
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 03:12:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15993C5F1FE;
	Fri,  7 Nov 2025 02:12:09 +0000 (UTC)
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com
 [113.46.200.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21B32C5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 02:12:07 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=ttYbeCKJ3OLF2JIak+cm/+0cAJg3a7naHdhTZ5oTJCM=;
 b=oTND7xti/NC2W3lp57ZxBg2RHkOYc/x3+yPpDVhMGAvw36UguiT3bsave9p82GjGlyyJlPVeJ
 riF/XR32j7XsPV8Z5V3xtQ+vm+V4FQD0LAWcXx1na6m0zI3r0qH38BwDsXDVzMiYcML6iuRsn1G
 5/ha/SAcUUlu419yWmwHzwM=
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4d2jFb4zgPz1cyV7;
 Fri,  7 Nov 2025 10:10:27 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 4D3F3140159;
 Fri,  7 Nov 2025 10:12:04 +0800 (CST)
Received: from kwepemq100008.china.huawei.com (7.202.195.91) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 10:12:04 +0800
Received: from DESKTOP-DKE2JV6.huawei.com (10.67.110.146) by
 kwepemq100008.china.huawei.com (7.202.195.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 10:12:03 +0800
From: Liyuan Pang <pangliyuan1@huawei.com>
To: <markus.elfring@web.de>
Date: Fri, 7 Nov 2025 10:11:37 +0800
Message-ID: <20251107021137.874150-1-pangliyuan1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dff05531-f5e3-400a-abf0-a5307c50357e@web.de>
References: <dff05531-f5e3-400a-abf0-a5307c50357e@web.de>
MIME-Version: 1.0
X-Originating-IP: [10.67.110.146]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq100008.china.huawei.com (7.202.195.91)
Cc: wanqian10@huawei.com, vigneshr@ti.com, pangliyuan1@huawei.com,
 linux-kernel@vger.kernel.org, richard@nod.at, young.liuyang@huawei.com,
 linux-mtd@lists.infradead.org, mcoquelin.stm32@gmail.com,
 miquel.raynal@bootlin.com, chengzhihao1@huawei.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ubi: fastmap: fix ubi->fm memory leak
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
Content-Type: multipart/mixed; boundary="===============3540628848030176020=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3540628848030176020==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

On Thu, 6 Nov 2025 16:16:05 +0100, Markus Elfring wrote:
>…
>> +++ b/drivers/mtd/ubi/fastmap.c
>> @@ -1644,3 +1644,15 @@ int ubi_update_fastmap(struct ubi_device *ubi)
>…
>> +void ubi_free_fastmap(struct ubi_device *ubi)
>> +{
>> +	int i;
>> +
>> +	if (ubi->fm) {
> +		for (i = 0; i < ubi->fm->used_blocks; i++)
> +			kmem_cache_free(ubi_wl_entry_slab, ubi->fm->e[i]);
>…
> +	}
> +}
>…
>
> May the local variable “i” be defined in the loop header?

I think it's better to leave it as it is, most of the code in
ubi defines variables outside the loop header, and defining
"i" in the loop header may cause compilation error in some old
kernel versions that use C89.

Regards,
Liyuan

--===============3540628848030176020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3540628848030176020==--
