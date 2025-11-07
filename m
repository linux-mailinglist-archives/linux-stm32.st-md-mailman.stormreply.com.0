Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F6C3F317
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 10:38:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C26FC5F1F4;
	Fri,  7 Nov 2025 09:38:55 +0000 (UTC)
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com
 [113.46.200.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F278AC1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 09:38:52 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=6lG6deOb5NWhbiwLUm26+RJ/9qVvh6HCnpI4bUBb76I=;
 b=v5tgvizviGkzq6i9w85nQ0e/oouNS2MNUiLdxt1++3ztywUoe0t2IHd/856wrUOr6RNNybqzg
 +ij4oQejd07Q42moNksHixcS7PwAq4Y4FOp5cCJ6jpQsdJUs94BcKN9bhvTb9VhEbrVFDxCt0NH
 Mk9TP6lEIvUCkEIqIAdebLc=
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4d2v9632KgzRhRy;
 Fri,  7 Nov 2025 17:37:14 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id 65501147B8F;
 Fri,  7 Nov 2025 17:38:50 +0800 (CST)
Received: from kwepemq100008.china.huawei.com (7.202.195.91) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 17:38:50 +0800
Received: from DESKTOP-DKE2JV6.huawei.com (10.67.110.146) by
 kwepemq100008.china.huawei.com (7.202.195.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 17:38:49 +0800
From: Liyuan Pang <pangliyuan1@huawei.com>
To: <markus.elfring@web.de>
Date: Fri, 7 Nov 2025 17:38:43 +0800
Message-ID: <20251107093843.1077536-1-pangliyuan1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <396b2d11-29ca-4fae-97c3-7280c879cbfd@web.de>
References: <396b2d11-29ca-4fae-97c3-7280c879cbfd@web.de>
MIME-Version: 1.0
X-Originating-IP: [10.67.110.146]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
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
Content-Type: multipart/mixed; boundary="===============7572135463507036102=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7572135463507036102==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

>>> …
>>>> +++ b/drivers/mtd/ubi/fastmap.c
>>>> @@ -1644,3 +1644,15 @@ int ubi_update_fastmap(struct ubi_device *ubi)
>>> …
>>>> +void ubi_free_fastmap(struct ubi_device *ubi)
>>>> +{
>>>> +	int i;
>>>> +
>>>> +	if (ubi->fm) {
>>> +		for (i = 0; i < ubi->fm->used_blocks; i++)
>>> +			kmem_cache_free(ubi_wl_entry_slab, ubi->fm->e[i]);
>>> …
>>> +	}
>>> +}
>>> …
>>>
>>> May the local variable “i” be defined in the loop header?
>> 
>> I think it's better to leave it as it is, most of the code in
>> ubi defines variables outside the loop header, and defining
>> "i" in the loop header may cause compilation error in some old
>> kernel versions that use C89.
>
>Would you support to reduce the scope for such a variable to
>the code block of the if branch?

Ok, I will send a v2 patch.

Regards,
Liyuan

--===============7572135463507036102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7572135463507036102==--
