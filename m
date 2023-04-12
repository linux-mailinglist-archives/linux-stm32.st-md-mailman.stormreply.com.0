Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D196DE925
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 03:53:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ADA8C65E4F;
	Wed, 12 Apr 2023 01:53:28 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 565B8C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 01:53:26 +0000 (UTC)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Px5Lw0DbCzDsg4;
 Wed, 12 Apr 2023 09:52:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 09:53:22 +0800
To: Xiaobing Luo <luoxiaobing0926@gmail.com>, <richard@nod.at>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
References: <20230411154634.149350-1-luoxiaobing0926@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cc9f9239-22b8-a00b-c46f-1b9ea8cd7395@huawei.com>
Date: Wed, 12 Apr 2023 09:53:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230411154634.149350-1-luoxiaobing0926@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
Cc: linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ubi: fastmap: Reserve PEBs and init
 fm_work when fastmap is used.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Xiaobing
> Don't reserve the two fastmap PEBs when fastmap is disabled, then we can
> use the two PEBs in small ubi device.
> And don't init the fm_work when fastmap is disabled.
> 
> Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
> ---
>   drivers/mtd/ubi/build.c      | 3 ++-
>   drivers/mtd/ubi/fastmap-wl.c | 2 +-
>   drivers/mtd/ubi/wl.c         | 6 +++++-
>   3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index ad025b2ee417..a98a717b0e66 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1120,7 +1120,8 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
>   		kthread_stop(ubi->bgt_thread);
>   
>   #ifdef CONFIG_MTD_UBI_FASTMAP
> -	cancel_work_sync(&ubi->fm_work);
> +	if (!ubi->fm_disabled)
> +		cancel_work_sync(&ubi->fm_work);
>   #endif
>   	ubi_debugfs_exit_dev(ubi);
>   	uif_close(ubi);
> diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
> index 863f571f1adb..b3df17a782c7 100644
> --- a/drivers/mtd/ubi/fastmap-wl.c
> +++ b/drivers/mtd/ubi/fastmap-wl.c
> @@ -344,7 +344,7 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
>   		/* We cannot update the fastmap here because this
>   		 * function is called in atomic context.
>   		 * Let's fail here and refill/update it as soon as possible. */
> -		if (!ubi->fm_work_scheduled) {
> +		if (!ubi->fm_work_scheduled && !ubi->fm_disabled) {
>   			ubi->fm_work_scheduled = 1;
>   			schedule_work(&ubi->fm_work);
>   		}

I think we should keep the fm_work even fm_disabled is true. UBI is 
running with fastmap scheme as long as CONFIG_MTD_UBI_FASTMAP is 
enabled, 'ubi->fm_disabled' is just used to control whether to 
persistence fastmap metadata on flash. Free wear-leveling pebs 
consuming/producing model still depend on following process:
Consuming: get_peb_for_wl -> pool->pebs[pool->used++]
Producing: ubi->fm_work -> update_fastmap_work_fn -> ubi_refill_pools -> 
wl_pool->used = 0
If we disable 'ubi->fm_work' when ubi->fm_disabled becomes true, 
wear-leveing work will fail to get free wl peb until someone try to get 
free peb by ubi_wl_get_peb().

> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 26a214f016c1..8906db89808f 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1908,7 +1908,11 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>   	ubi_assert(ubi->good_peb_count == found_pebs);
>   
>   	reserved_pebs = WL_RESERVED_PEBS;
> -	ubi_fastmap_init(ubi, &reserved_pebs);
> +
> +#ifdef CONFIG_MTD_UBI_FASTMAP
> +	if (!ubi->fm_disabled)
> +		ubi_fastmap_init(ubi, &reserved_pebs);
> +#endif
>   
>   	if (ubi->avail_pebs < reserved_pebs) {
>   		ubi_err(ubi, "no enough physical eraseblocks (%d, need %d)",
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
