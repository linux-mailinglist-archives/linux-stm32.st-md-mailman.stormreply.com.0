Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6953BD8386
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 10:39:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53D9BC3FACB;
	Tue, 14 Oct 2025 08:39:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E698C3F95F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 08:39:46 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so4003077f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760431186; x=1761035986;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YFWOuvnUfMwybXOtMoOd4svMVvGqzTx63g0iMz9e+aA=;
 b=trc8mc6hNNX09j8sSJtLHSivkIumC2Wm4j/HypyL3hIdEpTL2xPD3yavPNi3l7tknH
 aG0E3HbbGHmOR12QIsrYaA6oF4XzcPUJh8wLrnY464zUaIExCx1CdnrcryHKbURHU0l9
 tqAQs8ZIAM7Ibbwwckrd/lVQ3HY3cuJjr6q2fIsC1W/9FrSPb/ZyfNezNPD7KTxfmCoC
 OACsjID+W7EvPJVSAUQY6/DE/vnkKGsS4hfey0yaIdby+uWGEYBhn/nN9MibWttU1bwl
 2cCfZ1/+Ksw/VypCHbLFHU1ELV8V87a0PBmmuVsC5JB4M9fDTHmJwM0i+KBco7QwEW6c
 95OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760431186; x=1761035986;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YFWOuvnUfMwybXOtMoOd4svMVvGqzTx63g0iMz9e+aA=;
 b=vo3iC8E6XXPPcnqliamW8k++HxD7OxFFinPukL9zf6jp5JYF/hcPujeE8cdigX0jji
 GOkU19fKz14kUvEVE55NA0kJ39yB1R9f30by1r9bw2ERwTqveO09vvEfp1IOZXtrC7K/
 SSToQ0SocQGsQtwIdGDAoJL0t3i3uXxnMFx2+C3Z4IA6+BJY9NAd8RCRhEbXqRlQpE9R
 dilIajQNpPTDwBTzezhleTlnuNLE6/PF/fN3HpCEn/FveYvwIwSVGLCTefoRy/Y8nMHI
 cLoV4jhUvqJRchR5QK2btBviV5+D+mSkE88cSEVpKJUOhRY9WRsulKjqQ4x5hPtZNOgn
 voTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLBOf4KwTIXPp9Cj9YvQ5MQ/mpiK2HiG2YihGVVA0f4X1SO5iZv2TEtEAlKSm++lGLie2ddaGYs9Xfyw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVmp1om2L9lm1Y54fXa5nRsilS0IqvoMIzyD5PjmigDBxLYXva
 oYHa4bdPbVW+RQips57wDN2eN1SurTrBSh73P/laKBeA3Ax3O/AXoRHGiybmq8s2EII=
X-Gm-Gg: ASbGncsLwn2l5lV3mHRiwMmP8NXHu1gBIFFoHeekh/h7136zup4P3LItVdRUY0xC3q3
 T+rHi63M91aGsBntqMjuuzdpxMmNC1h7UEXrgDFBVXanlJkcONp7MAUMbABxuq/jmSGGwjbo9Go
 RHIpDuNH9d0sJ0TVbyw0lo50YguBk0aVOUhDn+P5Rw+9T7BGvczkI0iJX3XhMImW7MiBwmPaPf/
 TDBW8QRdboC151Jc9d9/FAE6SY7uABPapfxF9LMCaLJ5AQttzjXWqJGK/T8Yh3jq9ef61S5HI9o
 CTNF8S+3KGlWuzxwn4TcO66hdUBsYrqA2wgxrr/Yd/x3j2vcdC6ZyHB95ktmIeCcJurXCr149Vy
 sjEIZ0UWlJKF7XaTwic9Mlb1reS30YdjsKvitL2xtnlcWw+tOSE2++BZ+0okqxg==
X-Google-Smtp-Source: AGHT+IFDjuNxGsj9w5KIK44evH4nW82BXa1kd591GncY0F3Cb/1CX97GoQ+hu6emUu0ZcgJJ0c1fpA==
X-Received: by 2002:a05:6000:40da:b0:3f8:8aa7:465d with SMTP id
 ffacd0b85a97d-4266e7d4580mr13949163f8f.30.1760431185690; 
 Tue, 14 Oct 2025 01:39:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-426ce5e8a06sm22476317f8f.55.2025.10.14.01.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 01:39:45 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:39:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202510121908.7aduLIkw-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, lkp@intel.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/7] remoteproc: core: Use cleanup.h
 macros to simplify lock handling
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

Hi Peng,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/remoteproc-core-Drop-redundant-initialization-of-ret-in-rproc_shutdown/20251010-202737
base:   3b9b1f8df454caa453c7fb07689064edb2eda90a
patch link:    https://lore.kernel.org/r/20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c%40nxp.com
patch subject: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to simplify lock handling
config: i386-randconfig-141-20251012 (https://download.01.org/0day-ci/archive/20251012/202510121908.7aduLIkw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510121908.7aduLIkw-lkp@intel.com/

smatch warnings:
drivers/remoteproc/remoteproc_core.c:1841 rproc_trigger_recovery() warn: missing error code? 'ret'
drivers/remoteproc/remoteproc_core.c:1993 rproc_shutdown() warn: missing error code? 'ret'

vim +/ret +1841 drivers/remoteproc/remoteproc_core.c

70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1829  int rproc_trigger_recovery(struct rproc *rproc)
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1830  {
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1831  	struct device *dev = &rproc->dev;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1832  	int ret;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1833  
c42baf6f84c7694 Peng Fan             2025-10-10  1834  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
c42baf6f84c7694 Peng Fan             2025-10-10  1835  	ret = ACQUIRE_ERR(mutex_intr, &lock);
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1836  	if (ret)
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1837  		return ret;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1838  
0b145574b6cd2b3 Alex Elder           2020-02-28  1839  	/* State could have changed before we got the mutex */
0b145574b6cd2b3 Alex Elder           2020-02-28  1840  	if (rproc->state != RPROC_CRASHED)
c42baf6f84c7694 Peng Fan             2025-10-10 @1841  		return ret;

Please change this to either "return 0;" or "return -ERRORCODE;"

0b145574b6cd2b3 Alex Elder           2020-02-28  1842  
0b145574b6cd2b3 Alex Elder           2020-02-28  1843  	dev_err(dev, "recovering %s\n", rproc->name);
0b145574b6cd2b3 Alex Elder           2020-02-28  1844  
ba194232edc032b Peng Fan             2022-09-28  1845  	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
ba194232edc032b Peng Fan             2022-09-28  1846  		ret = rproc_attach_recovery(rproc);
ba194232edc032b Peng Fan             2022-09-28  1847  	else
ba194232edc032b Peng Fan             2022-09-28  1848  		ret = rproc_boot_recovery(rproc);
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1849  
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1850  	return ret;
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1851  }

[ snip ]

c13b780c4597e1e Suman Anna           2022-02-13  1976  int rproc_shutdown(struct rproc *rproc)
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1977  {
b5ab5e24e960b9f Ohad Ben-Cohen       2012-05-30  1978  	struct device *dev = &rproc->dev;
ee3d85da617a065 Peng Fan             2025-10-10  1979  	int ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1980  
c42baf6f84c7694 Peng Fan             2025-10-10  1981  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
c42baf6f84c7694 Peng Fan             2025-10-10  1982  	ret = ACQUIRE_ERR(mutex_intr, &lock);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1983  	if (ret) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1984  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
c13b780c4597e1e Suman Anna           2022-02-13  1985  		return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1986  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1987  
c42baf6f84c7694 Peng Fan             2025-10-10  1988  	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
c42baf6f84c7694 Peng Fan             2025-10-10  1989  		return -EINVAL;
5e6a0e05270e3a4 Shengjiu Wang        2022-03-28  1990  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1991  	/* if the remote proc is still needed, bail out */
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1992  	if (!atomic_dec_and_test(&rproc->power))
c42baf6f84c7694 Peng Fan             2025-10-10 @1993  		return ret;

Same.

400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1994  
fcd58037f28bf70 Arnaud Pouliquen     2018-04-10  1995  	ret = rproc_stop(rproc, false);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1996  	if (ret) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1997  		atomic_inc(&rproc->power);
c42baf6f84c7694 Peng Fan             2025-10-10  1998  		return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1999  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2000  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2001  	/* clean up all acquired resources */
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2002  	rproc_resource_cleanup(rproc);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2003  
33467ac3c8dc805 Loic Pallardy        2020-04-16  2004  	/* release HW resources if needed */
33467ac3c8dc805 Loic Pallardy        2020-04-16  2005  	rproc_unprepare_device(rproc);
33467ac3c8dc805 Loic Pallardy        2020-04-16  2006  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2007  	rproc_disable_iommu(rproc);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2008  
988d204cdaf604c Bjorn Andersson      2016-08-11  2009  	/* Free the copy of the resource table */
a0c10687ec9506b Bjorn Andersson      2016-12-30  2010  	kfree(rproc->cached_table);
a0c10687ec9506b Bjorn Andersson      2016-12-30  2011  	rproc->cached_table = NULL;
988d204cdaf604c Bjorn Andersson      2016-08-11  2012  	rproc->table_ptr = NULL;
c42baf6f84c7694 Peng Fan             2025-10-10  2013  
c13b780c4597e1e Suman Anna           2022-02-13  2014  	return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2015  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
