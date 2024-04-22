Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E688ACCAD
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 14:21:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17BD9C7128B;
	Mon, 22 Apr 2024 12:21:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F32B4C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713788504; x=1745324504;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UTkmHZeikRa1ycDagwCQkNkwCuglgm4WeonLx4GtOEw=;
 b=Ao3STYlyXMJjDx2O5H5NxGzBNSMLFWupr+NDEQ3ixnhhk/VomkfI1gj2
 jK1ciFRrCWJyUGyCCnB5yRMaRrAeseLSeZ+CxVuzfmj7Tba2BxKr3r0Ui
 IU5rFyWNxgdTXmM7SbNq9HtdnikkkOmsnszgQkYg705WtDr56ivfOTtfF
 ICDcMwl8+96eWdLC9uIq9n6DRQR6/4fxejl6MqUmZzxLxcXU7kW/Mnizv
 KLhLPmbLKwbHI0w5Qdyg6XCK6+U90LkP8hR+c4KMCMPLKXL3Z8acjwsiu
 fk30zeznJMU8MfqY6mC90GThx2oELrcAZWrvqL1bOdBqT3v9MKkq3or4o g==;
X-CSE-ConnectionGUID: 6UXbS3BUS3KhqtgaKYCDJg==
X-CSE-MsgGUID: fDYRagN1TWe++Y9RiqPI8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="13110022"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="13110022"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 05:21:42 -0700
X-CSE-ConnectionGUID: M3MyFjZSToWhCUpBOEqfEw==
X-CSE-MsgGUID: 54UoqB0yTdG9DYu9uyRjRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="61448676"
Received: from lkp-server01.sh.intel.com (HELO 69a5ba6c3aa8) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 22 Apr 2024 05:21:39 -0700
Received: from kbuild by 69a5ba6c3aa8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rysfw-00002m-1H;
 Mon, 22 Apr 2024 12:21:36 +0000
Date: Mon, 22 Apr 2024 20:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime MERE <maxime.mere@foss.st.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202404222021.S9hjJBpb-lkp@intel.com>
References: <20240418144256.3736800-2-maxime.mere@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418144256.3736800-2-maxime.mere@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] crypto: stm32/cryp - use dma when
	possible.
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

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on herbert-crypto-2.6/master herbert-cryptodev-2.6/master linus/master v6.9-rc5 next-20240422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-MERE/crypto-stm32-cryp-use-dma-when-possible/20240418-224748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20240418144256.3736800-2-maxime.mere%40foss.st.com
patch subject: [PATCH 1/3] crypto: stm32/cryp - use dma when possible.
config: arm-randconfig-r081-20240422 (https://download.01.org/0day-ci/archive/20240422/202404222021.S9hjJBpb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404222021.S9hjJBpb-lkp@intel.com/

smatch warnings:
drivers/crypto/stm32/stm32-cryp.c:1496 stm32_cryp_truncate_sg() warn: unsigned 'alloc_sg_len' is never less than zero.
drivers/crypto/stm32/stm32-cryp.c:1580 stm32_cryp_cipher_prepare() warn: unsigned 'cryp->in_sg_len' is never less than zero.
drivers/crypto/stm32/stm32-cryp.c:1584 stm32_cryp_cipher_prepare() warn: unsigned 'cryp->out_sg_len' is never less than zero.

vim +/alloc_sg_len +1496 drivers/crypto/stm32/stm32-cryp.c

  1481	
  1482	static int stm32_cryp_truncate_sg(struct scatterlist **new_sg, size_t *new_sg_len,
  1483					  struct scatterlist *sg, off_t skip, size_t size)
  1484	{
  1485		struct scatterlist *cur;
  1486		size_t alloc_sg_len;
  1487	
  1488		*new_sg_len = 0;
  1489	
  1490		if (!sg || !size) {
  1491			*new_sg = NULL;
  1492			return 0;
  1493		}
  1494	
  1495		alloc_sg_len = sg_nents_for_len(sg, skip + size);
> 1496		if (alloc_sg_len < 0)
  1497			return alloc_sg_len;
  1498	
  1499		/* We allocate to much sg entry, but it is easier */
  1500		*new_sg = kmalloc_array(alloc_sg_len, sizeof(struct scatterlist), GFP_KERNEL);
  1501		if (!*new_sg)
  1502			return -ENOMEM;
  1503	
  1504		sg_init_table(*new_sg, alloc_sg_len);
  1505	
  1506		cur = *new_sg;
  1507		while (sg && size) {
  1508			unsigned int len = sg->length;
  1509			unsigned int offset = sg->offset;
  1510	
  1511			if (skip > len) {
  1512				skip -= len;
  1513				sg = sg_next(sg);
  1514				continue;
  1515			}
  1516	
  1517			if (skip) {
  1518				len -= skip;
  1519				offset += skip;
  1520				skip = 0;
  1521			}
  1522	
  1523			if (size < len)
  1524				len = size;
  1525	
  1526			if (len > 0) {
  1527				(*new_sg_len)++;
  1528				size -= len;
  1529				sg_set_page(cur, sg_page(sg), len, offset);
  1530				if (size == 0)
  1531					sg_mark_end(cur);
  1532				cur = sg_next(cur);
  1533			}
  1534	
  1535			sg = sg_next(sg);
  1536		}
  1537	
  1538		return 0;
  1539	}
  1540	
  1541	static int stm32_cryp_cipher_prepare(struct stm32_cryp *cryp, struct scatterlist *in_sg,
  1542					     struct scatterlist *out_sg)
  1543	{
  1544		size_t align_size;
  1545	
  1546		cryp->dma_mode = stm32_cryp_dma_check(cryp, in_sg, out_sg);
  1547	
  1548		scatterwalk_start(&cryp->in_walk, in_sg);
  1549		scatterwalk_start(&cryp->out_walk, out_sg);
  1550	
  1551		if (cryp->dma_mode == NO_DMA) {
  1552			cryp->flags &= ~FLG_IN_OUT_DMA;
  1553	
  1554			if (is_ctr(cryp))
  1555				memset(cryp->last_ctr, 0, sizeof(cryp->last_ctr));
  1556	
  1557		} else if (cryp->dma_mode == DMA_NEED_SG_TRUNC) {
  1558			int ret;
  1559	
  1560			cryp->flags |= FLG_IN_OUT_DMA;
  1561	
  1562			align_size = ALIGN_DOWN(cryp->payload_in, cryp->hw_blocksize);
  1563			ret = stm32_cryp_truncate_sg(&cryp->in_sg, &cryp->in_sg_len, in_sg, 0, align_size);
  1564			if (ret)
  1565				return ret;
  1566	
  1567			ret = stm32_cryp_truncate_sg(&cryp->out_sg, &cryp->out_sg_len, out_sg, 0,
  1568						     align_size);
  1569			if (ret) {
  1570				kfree(cryp->in_sg);
  1571				return ret;
  1572			}
  1573		} else {
  1574			cryp->flags |= FLG_IN_OUT_DMA;
  1575	
  1576			cryp->in_sg = in_sg;
  1577			cryp->out_sg = out_sg;
  1578	
  1579			cryp->in_sg_len = sg_nents_for_len(cryp->in_sg, cryp->payload_in);
> 1580			if (cryp->in_sg_len < 0)
  1581				return cryp->in_sg_len;
  1582	
  1583			cryp->out_sg_len = sg_nents_for_len(out_sg, cryp->payload_out);
> 1584			if (cryp->out_sg_len < 0)
  1585				return cryp->out_sg_len;
  1586		}
  1587	
  1588		return 0;
  1589	}
  1590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
