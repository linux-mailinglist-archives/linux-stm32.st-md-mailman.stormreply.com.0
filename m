Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A387BCDF
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2019 11:22:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E956C35E01;
	Wed, 31 Jul 2019 09:22:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85EBCC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 09:22:34 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6V9LhQM018619; Wed, 31 Jul 2019 11:22:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=0+TG/KmIfhy76AN65jf9ni8GDElR6aasDlbrUpq3UD8=;
 b=v/CbvhgoHC7bta5GYMBQKiRFk+0gYjrA3s754v+S/1+VzuOyruHIfVNz2ORfwNVeG95r
 1CZrsv6GXZHUJpmgnvdFRCoswfmy96MSk81FNhuNX+UtXGgzrOKDWN86XzvT0mxMvbnj
 jT6n9DeF0c1HaP/9LPHYzSp9ZgNGMaD799bD2sjedbxEtsBeQV8tThC/AMd4SK58djSg
 GFoHpfKJMyetj1VJdHyS1AJps6QRW7vvwnmra4YruZ69FSx/flmCR5a/wWmMwOqsZPQA
 PZiwUNIraJUE9WXD9xkrErdzBdWi7bxWmhMrtqH9TvGtlt6Zwr7nGpE4OwS+UCbj8qEr yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0ccwqefa-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 31 Jul 2019 11:22:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBDA63F;
 Wed, 31 Jul 2019 09:22:17 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB95DCC8DF;
 Wed, 31 Jul 2019 11:22:17 +0200 (CEST)
Received: from SFHDAG7NODE2.st.com (10.75.127.20) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 11:22:17 +0200
Received: from SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090]) by
 SFHDAG7NODE2.st.com ([fe80::d548:6a8f:2ca4:2090%20]) with mapi id
 15.00.1473.003; Wed, 31 Jul 2019 11:22:17 +0200
From: Loic PALLARDY <loic.pallardy@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 Jonathan Corbet <corbet@lwn.net>, "linux-remoteproc@vger.kernel.org"
 <linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>
Thread-Topic: [PATCH 2/6] hwspinlock: allow sharing of hwspinlocks
Thread-Index: AQHU2bS6L3QZamBVFkievfUMjcJ+56blTrKg
Date: Wed, 31 Jul 2019 09:22:17 +0000
Message-ID: <3238562932094718b902ee0a2e3a3c8e@SFHDAG7NODE2.st.com>
References: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
 <1552492237-28810-3-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1552492237-28810-3-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-31_04:, , signatures=0
Cc: Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Linux-stm32] [PATCH 2/6] hwspinlock: allow sharing of
	hwspinlocks
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



> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of Fabien Dessenne
> Sent: mercredi 13 mars 2019 16:51
> To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; Rob Herring <robh+dt@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Alexandre TORGUE
> <alexandre.torgue@st.com>; Jonathan Corbet <corbet@lwn.net>; linux-
> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-doc@vger.kernel.org
> Cc: Fabien DESSENNE <fabien.dessenne@st.com>; Benjamin GAIGNARD
> <benjamin.gaignard@st.com>
> Subject: [PATCH 2/6] hwspinlock: allow sharing of hwspinlocks
> 
> The current implementation does not allow different devices to use a
> common hwspinlock. Offer the possibility to use the same hwspinlock by
> several users.
> If a device registers to the framework with #hwlock-cells = 2, then
> the second parameter of the 'hwlocks' DeviceTree property defines
> whether an hwlock is requested for an exclusive or a shared usage.
> If a device registers with #hwlock-cells = 1, then all the hwlocks are
> for an exclusive usage.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Looks good for me.
Acked-by: Loic Pallardy <loic.pallardy@st.com>
Regards,
Loic

> ---
>  Documentation/hwspinlock.txt             | 10 ++--
>  drivers/hwspinlock/hwspinlock_core.c     | 82
> +++++++++++++++++++++++++-------
>  drivers/hwspinlock/hwspinlock_internal.h |  2 +
>  3 files changed, 73 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/hwspinlock.txt b/Documentation/hwspinlock.txt
> index ed640a2..e6ce2dd 100644
> --- a/Documentation/hwspinlock.txt
> +++ b/Documentation/hwspinlock.txt
> @@ -54,9 +54,11 @@ Should be called from a process context (might sleep).
>    struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
> 
>  Assign a specific hwspinlock id and return its address, or NULL
> -if that hwspinlock is already in use. Usually board code will
> -be calling this function in order to reserve specific hwspinlock
> -ids for predefined purposes.
> +if that hwspinlock is already in use and not shared. If that specific
> +hwspinlock is declared as shared, it can be requested and used by
> +several users.
> +Usually board code will be calling this function in order to reserve
> +specific hwspinlock ids for predefined purposes.
> 
>  Should be called from a process context (might sleep).
> 
> @@ -368,11 +370,13 @@ of which represents a single hardware lock::
>  	* struct hwspinlock - this struct represents a single hwspinlock
> instance
>  	* @bank: the hwspinlock_device structure which owns this lock
>  	* @lock: initialized and used by hwspinlock core
> +	* @refcount: number of users (when shared)
>  	* @priv: private data, owned by the underlying platform-specific
> hwspinlock drv
>  	*/
>  	struct hwspinlock {
>  		struct hwspinlock_device *bank;
>  		spinlock_t lock;
> +		unsigned int refcount;
>  		void *priv;
>  	};
> 
> diff --git a/drivers/hwspinlock/hwspinlock_core.c
> b/drivers/hwspinlock/hwspinlock_core.c
> index 2bad40d..53afdeb 100644
> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -25,6 +25,8 @@
> 
>  /* radix tree tags */
>  #define HWSPINLOCK_UNUSED	(0) /* tags an hwspinlock as unused
> */
> +#define HWSPINLOCK_EXCLUSIVE	(1) /* tags an hwspinlock as exclusive
> */
> +#define HWSPINLOCK_SHARED	(2) /* tags an hwspinlock as shared */
> 
>  /*
>   * A radix tree is used to maintain the available hwspinlock instances.
> @@ -291,7 +293,7 @@ EXPORT_SYMBOL_GPL(__hwspin_unlock);
>   * @hwlock_spec: hwlock specifier as found in the device tree
>   *
>   * This is a simple translation function, suitable for hwspinlock platform
> - * drivers that only has a lock specifier length of 1.
> + * drivers that only has a lock specifier length of 1 or 2.
>   *
>   * Returns a relative index of the lock within a specified bank on success,
>   * or -EINVAL on invalid specifier cell count.
> @@ -299,7 +301,8 @@ EXPORT_SYMBOL_GPL(__hwspin_unlock);
>  static inline int
>  of_hwspin_lock_simple_xlate(const struct of_phandle_args *hwlock_spec)
>  {
> -	if (WARN_ON(hwlock_spec->args_count != 1))
> +	if (WARN_ON(hwlock_spec->args_count != 1 &&
> +		    hwlock_spec->args_count != 2))
>  		return -EINVAL;
> 
>  	return hwlock_spec->args[0];
> @@ -322,11 +325,12 @@ of_hwspin_lock_simple_xlate(const struct
> of_phandle_args *hwlock_spec)
>  int of_hwspin_lock_get_id(struct device_node *np, int index)
>  {
>  	struct of_phandle_args args;
> -	struct hwspinlock *hwlock;
> +	struct hwspinlock *hwlock, *tmp;
>  	struct radix_tree_iter iter;
>  	void **slot;
>  	int id;
>  	int ret;
> +	unsigned int tag;
> 
>  	ret = of_parse_phandle_with_args(np, "hwlocks", "#hwlock-cells",
> index,
>  					 &args);
> @@ -361,6 +365,37 @@ int of_hwspin_lock_get_id(struct device_node *np,
> int index)
>  	}
>  	id += hwlock->bank->base_id;
> 
> +	/* Set the EXCLUSIVE / SHARED tag */
> +	if (args.args_count == 2 && args.args[1]) {
> +		/* Tag SHARED unless already tagged EXCLUSIVE */
> +		if (radix_tree_tag_get(&hwspinlock_tree, id,
> +				       HWSPINLOCK_EXCLUSIVE)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		tag = HWSPINLOCK_SHARED;
> +	} else {
> +		/* Tag EXCLUSIVE unless already tagged SHARED */
> +		if (radix_tree_tag_get(&hwspinlock_tree, id,
> +				       HWSPINLOCK_SHARED)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		tag = HWSPINLOCK_EXCLUSIVE;
> +	}
> +
> +	/* mark this hwspinlock */
> +	hwlock = radix_tree_lookup(&hwspinlock_tree, id);
> +	if (!hwlock) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	tmp = radix_tree_tag_set(&hwspinlock_tree, id, tag);
> +
> +	/* self-sanity check which should never fail */
> +	WARN_ON(tmp != hwlock);
> +
>  out:
>  	of_node_put(args.np);
>  	return ret ? ret : id;
> @@ -483,6 +518,7 @@ int hwspin_lock_register(struct hwspinlock_device
> *bank, struct device *dev,
> 
>  		spin_lock_init(&hwlock->lock);
>  		hwlock->bank = bank;
> +		hwlock->refcount = 0;
> 
>  		ret = hwspin_lock_register_single(hwlock, base_id + i);
>  		if (ret)
> @@ -625,7 +661,7 @@ static int __hwspin_lock_request(struct hwspinlock
> *hwlock)
>  {
>  	struct device *dev = hwlock->bank->dev;
>  	struct hwspinlock *tmp;
> -	int ret;
> +	int ret, id;
> 
>  	/* prevent underlying implementation from being removed */
>  	if (!try_module_get(dev->driver->owner)) {
> @@ -642,13 +678,18 @@ static int __hwspin_lock_request(struct hwspinlock
> *hwlock)
>  		return ret;
>  	}
> 
> +	/* update shareable refcount */
> +	id = hwlock_to_id(hwlock);
> +	if (radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_SHARED)
> &&
> +	    hwlock->refcount++)
> +		goto out;
> +
>  	/* mark hwspinlock as used, should not fail */
> -	tmp = radix_tree_tag_clear(&hwspinlock_tree,
> hwlock_to_id(hwlock),
> -
> 	HWSPINLOCK_UNUSED);
> +	tmp = radix_tree_tag_clear(&hwspinlock_tree, id,
> HWSPINLOCK_UNUSED);
> 
>  	/* self-sanity check that should never fail */
>  	WARN_ON(tmp != hwlock);
> -
> +out:
>  	return ret;
>  }
> 
> @@ -742,9 +783,9 @@ struct hwspinlock
> *hwspin_lock_request_specific(unsigned int id)
>  	/* sanity check (this shouldn't happen) */
>  	WARN_ON(hwlock_to_id(hwlock) != id);
> 
> -	/* make sure this hwspinlock is unused */
> -	ret = radix_tree_tag_get(&hwspinlock_tree, id,
> HWSPINLOCK_UNUSED);
> -	if (ret == 0) {
> +	/* make sure this hwspinlock is unused or shareable */
> +	if (!radix_tree_tag_get(&hwspinlock_tree, id,
> HWSPINLOCK_SHARED) &&
> +	    !radix_tree_tag_get(&hwspinlock_tree, id,
> HWSPINLOCK_UNUSED)) {
>  		pr_warn("hwspinlock %u is already in use\n", id);
>  		hwlock = NULL;
>  		goto out;
> @@ -777,7 +818,7 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
>  {
>  	struct device *dev;
>  	struct hwspinlock *tmp;
> -	int ret;
> +	int ret, id;
> 
>  	if (!hwlock) {
>  		pr_err("invalid hwlock\n");
> @@ -788,30 +829,35 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
>  	mutex_lock(&hwspinlock_tree_lock);
> 
>  	/* make sure the hwspinlock is used */
> -	ret = radix_tree_tag_get(&hwspinlock_tree, hwlock_to_id(hwlock),
> -
> 	HWSPINLOCK_UNUSED);
> +	id = hwlock_to_id(hwlock);
> +	ret = radix_tree_tag_get(&hwspinlock_tree, id,
> HWSPINLOCK_UNUSED);
>  	if (ret == 1) {
>  		dev_err(dev, "%s: hwlock is already free\n", __func__);
>  		dump_stack();
>  		ret = -EINVAL;
> -		goto out;
> +		goto unlock;
>  	}
> 
>  	/* notify the underlying device that power is not needed */
>  	ret = pm_runtime_put(dev);
>  	if (ret < 0)
> -		goto out;
> +		goto unlock;
> +
> +	/* update shareable refcount */
> +	if (radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_SHARED)
> &&
> +	    --hwlock->refcount)
> +		goto put;
> 
>  	/* mark this hwspinlock as available */
> -	tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
> -
> 	HWSPINLOCK_UNUSED);
> +	tmp = radix_tree_tag_set(&hwspinlock_tree, id,
> HWSPINLOCK_UNUSED);
> 
>  	/* sanity check (this shouldn't happen) */
>  	WARN_ON(tmp != hwlock);
> 
> +put:
>  	module_put(dev->driver->owner);
> 
> -out:
> +unlock:
>  	mutex_unlock(&hwspinlock_tree_lock);
>  	return ret;
>  }
> diff --git a/drivers/hwspinlock/hwspinlock_internal.h
> b/drivers/hwspinlock/hwspinlock_internal.h
> index 9eb6bd0..c808e11 100644
> --- a/drivers/hwspinlock/hwspinlock_internal.h
> +++ b/drivers/hwspinlock/hwspinlock_internal.h
> @@ -35,11 +35,13 @@ struct hwspinlock_ops {
>   * struct hwspinlock - this struct represents a single hwspinlock instance
>   * @bank: the hwspinlock_device structure which owns this lock
>   * @lock: initialized and used by hwspinlock core
> + * @refcount: number of users (when shared)
>   * @priv: private data, owned by the underlying platform-specific hwspinlock
> drv
>   */
>  struct hwspinlock {
>  	struct hwspinlock_device *bank;
>  	spinlock_t lock;
> +	unsigned int refcount;
>  	void *priv;
>  };
> 
> --
> 2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
