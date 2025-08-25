Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D06B337E0
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 09:35:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E71F6C36B1F;
	Mon, 25 Aug 2025 07:35:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A60B2C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 07:35:22 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45b5d49ae47so3963175e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 00:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756107322; x=1756712122;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qLqDCAEeqZueR/V1nZAa0eICESVjVswaFOTFOoFfvYo=;
 b=I+Oe5x2GP0W1DfB56VdzQ3n+aZgCfM04/7BCpVf4PqJO8Xc9TOjdywlHfs/ynJ+p23
 AMy7Pgwt/pSWvoeVQ442s8ny4hGkpHhBU/XGqzalXRQbQk5M01BKhlue4x53EX2K0JG6
 QMOYK8JcrZ+ai3OekVkWIFBpL4ZSPQwDOIeY5Ida9mAZcBn/YR2Ru05X6x2S5X16yfHY
 M7KyQFV+l0H2IyjwKoMBVIKgT1DZRTtTDfme3UHOAd5V2hDjNRfmL5ul0sA+aZC38/OK
 KT9v3254EfOCU+5XhulmqpZuEK2Gt+A7ZozAP5YLFX35pT+XEI/pUXCIfW+7PxUj96RO
 bnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756107322; x=1756712122;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qLqDCAEeqZueR/V1nZAa0eICESVjVswaFOTFOoFfvYo=;
 b=bRG6F9iWA4lP/rmBZpofb/pdjDzTlKllyPedrzeyRfOYvnGeHWdqSvBlIebsSeojB2
 ZWSaLxRsC7XXlCzbD4TOz0Z3T7EdqMOLGONe87g1ANgUfnXBIJA0Jk03wuRrzJixQv8m
 HKwL7xiSgrXmOE0xl4BjmA4/wUhwgeZ8nQ8IZ1wDVsOAtunv+JJG+7aEL+PE50SJhUtz
 BjK9iztxPwHGpfdwX2Lisb+wo+qXX77K6k3T4X1XNrG8p50cJLUMPxxKiYBALKcatlSb
 J0B81XCY4raQeokDKkwcOVjBIWsP6FFfl3JYXXRNuzH0EqVrF5IAyRsACkFqiIMTqLnl
 tVaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYNw8jUX0z6xiSFNJClZwxNGq5EqE3uY0O9Nln781Et88tpEmHVjN5/mE83uoCuglr1bqGHzbm/euu6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzXoACdDr13TIXMKlRKyoHvNm1816KbmlmvpnVa2RT1rwi1Ump3
 CSntSVnkeHhIJjMWs+nSdhstqg9hhLbGX3YyihAElkVQRLPQHARz31N0vE9R7/ARURI=
X-Gm-Gg: ASbGncsn+VbWWWQ8/BFtxMuxs5PRy9t2kSdLB7C416snUUVrx+qKhLKjPnMKDdZq7he
 qYQZ3/C5TBDD9IhdfFNkU5pn4Na79v2isy5UrlDggGnl30Y7WZcdagMiU5GDHOw6NXB53zC1Qr7
 O4DYGwp24U1Fnn1D59OODoPCXzwkg69RXCH10+DTvvnFoqN9XbgfmDXjicm/IzFhnODhhf3RVrA
 t/JWUunmaGjALiYnEO2coquiDIPTP/kbJlltXd9v2KtNscsuG43OYJHNuzA8EhQiGi0ud0OsEtt
 aIbUYjyd0gR5VafxIuZ/dS9B+RS4zrMbaKkzyHjW9dshVZ244F6o1b/Q00Ra+7ARPqOmNJ/tQmQ
 6OSUQM4Vgzf5P+WYDVf3LBS6j/H0=
X-Google-Smtp-Source: AGHT+IErURa0Xlnp2EqAvu9MT0KYK+YicwHUY5MOLIbTG3b7xCaO3SGy7MLRfklR+AK/4jewEFfrgw==
X-Received: by 2002:a05:600c:3155:b0:456:21d2:c6f7 with SMTP id
 5b1f17b1804b1-45b517b99ecmr101326305e9.23.1756107321591; 
 Mon, 25 Aug 2025 00:35:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b5748e743sm99362065e9.17.2025.08.25.00.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 00:35:21 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:35:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202508250637.nLxtkS26-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821130356.883553-1-raphael.gallais-pou@foss.st.com>
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: unify log system
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

Hi Raphael,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/drm-stm-ltdc-unify-log-system/20250821-210930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20250821130356.883553-1-raphael.gallais-pou%40foss.st.com
patch subject: [PATCH] drm/stm: ltdc: unify log system
config: arm-randconfig-r072-20250824 (https://download.01.org/0day-ci/archive/20250825/202508250637.nLxtkS26-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508250637.nLxtkS26-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1150 ltdc_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 1148)
drivers/gpu/drm/stm/ltdc.c:1174 ltdc_crtc_verify_crc_source() warn: variable dereferenced before check 'crtc' (see line 1172)

vim +/crtc +1150 drivers/gpu/drm/stm/ltdc.c

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1143  static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1144  {
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1145  	struct ltdc_device *ldev;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1146  	int ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1147  
fa2b2390600532 Raphael Gallais-Pou 2025-08-21 @1148  	drm_dbg_driver(crtc->dev, "\n");
                                                                       ^^^^^^^^^
Dereference.  A lot of the time people would suggest to delete these
types of printks and use ftrace instead.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1149  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1150  	if (!crtc)
                                                            ^^^^^
Checked too late.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1151  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1152  
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1153  	ldev = crtc_to_ltdc(crtc);
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1154  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1155  	if (source && strcmp(source, "auto") == 0) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1156  		ldev->crc_active = true;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1157  		ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1158  	} else if (!source) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1159  		ldev->crc_active = false;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1160  		ret = regmap_clear_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1161  	} else {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1162  		ret = -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1163  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1164  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1165  	ldev->crc_skip_count = 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1166  	return ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1167  }
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1168  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1169  static int ltdc_crtc_verify_crc_source(struct drm_crtc *crtc,
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1170  				       const char *source, size_t *values_cnt)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1171  {
fa2b2390600532 Raphael Gallais-Pou 2025-08-21 @1172  	drm_dbg_driver(crtc->dev, "\n");
                                                                        ^^^^^^^^
Dereference

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1173  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1174  	if (!crtc)
                                                            ^^^^^
Too late.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1175  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1176  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1177  	if (source && strcmp(source, "auto") != 0) {
fa2b2390600532 Raphael Gallais-Pou 2025-08-21  1178  		drm_dbg_driver(crtc->dev, "Unknown CRC source %s for %s\n",
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1179  			       source, crtc->name);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1180  		return -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1181  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1182  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1183  	*values_cnt = 1;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1184  	return 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1185  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
