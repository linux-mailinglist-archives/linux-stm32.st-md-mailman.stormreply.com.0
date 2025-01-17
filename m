Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C748DA14B43
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2025 09:38:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5413AC78F80;
	Fri, 17 Jan 2025 08:38:25 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90A9FC78F7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 08:38:18 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso11677565e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 00:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737103098; x=1737707898;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eJ1ei5cf4bIYP2dhBSNsW7gRWvtxXhyGMsyM2uckNOk=;
 b=zGmW8r/Qk87BvcvM60BY6A0shSOvClN4xrz//XG76J6JTbVS9jM9Xniq24T5b45+65
 ag6h5HFMXS1Bh8PtaYySng+X/JJIhPaSfINRxAdB7BqnYRPKtEm5OFWJ6VGxAJ65X+vn
 wzcboqlWcEU3oCvxR4XFqnmwoLd3i42CFagv2pzWYNsJE/drzw6XP21Twd3I97Ms3MwZ
 w+SsiNQO5xayxa5x1wzF16fi2O+KynZGJH3XJafkWlwE9B2xGe+sgG7+jnrHizepZfJi
 THCqfUJKYn+3ODYupITh5Rbm5i3WEB14Hm/XSYEA47AE/uXRpHGZu+WI1rpWnjYRE6zz
 dQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737103098; x=1737707898;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eJ1ei5cf4bIYP2dhBSNsW7gRWvtxXhyGMsyM2uckNOk=;
 b=bezKaS/pZSP1gpsUUlpGmbMfAHWCUzVowOJ4rRd/g75MP8OKkrKeyUhsHfRqAbBsBR
 LdGdNFw6TDLAilfh8Bfk0Ubd9OBIV8zMafZK0srf8BMjyKom/u24fceBGZfrsdJR5u6O
 KGwgearipbJ1AdPVoanzQfg7br+IRPsX+4+RKaMmTniFE5sPVd5WHZd9R2x4dMuCFKbM
 8XTOK64J3r93P5BRr6Il+SdgHKNogAGl6ARMkn2/bN8WCVWbTAGbcUvxmMLRDozTJMh9
 LoGj3MUocivZMxZDS0PWnesYOOv8AMLbcOOWeTdQ0509hXtblI5LhdkKZku5+1yvp36Y
 mhWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6nNjWfKkQhayT0oHB/vU0zN4bNGVFRNlkZUJ7YXghU7iuqij8v1/RPX2IjlomSzplsjyEgTy38I7epg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+4QXgQBzHOWNVZBhfKp4Yx3KFfSHKvMOhCmljQHNVF1A9foSS
 uvtXVT6IqJyFqjv1qNhDn9a+px+EIGdtFh+KNN1RZKH/IrfRcHjrAEupKx1MeZU=
X-Gm-Gg: ASbGncutTbp4MZpQVunMguQxbtBDKDgGbtHb3p677/3/JMLz8pqw/wXBZHy9imFZV3x
 9DSnOdtlozkD9KhADSOagL+vGJRv025l19U4dCNp3f8bsl0p+sYlcCwONgM5Fs0YunKPyq/ZM5H
 WxO+4+eM2DP9ROnfFbMuCD2vseYB7LA8Mfv74Pd3A/W5j2+R8iXclCTE4dTjyLv8VVCJLpYotUD
 4ZWk9RKJDAXGBHvtODIn0Iem+6zEzw6O/8rmpn5wzkH4ybkEs2ZuMRikqtLhA==
X-Google-Smtp-Source: AGHT+IHHCRSsCNB3Pr//Zs9JSCQC5BMsN2QD0gja4Pnf4e3R/D/iBTCkc6sIgLA7rH4i2gWt+Va7zw==
X-Received: by 2002:a05:600c:138a:b0:434:9d62:aa23 with SMTP id
 5b1f17b1804b1-4389142e88dmr14685205e9.20.1737103098043; 
 Fri, 17 Jan 2025 00:38:18 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c0f03984sm81066365e9.0.2025.01.17.00.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 00:38:17 -0800 (PST)
Date: Fri, 17 Jan 2025 11:38:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
 Christian Bruel <christian.bruel@foss.st.com>, vkoul@kernel.org,
 kishon@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
Message-ID: <d40db5ae-5db8-4541-8d20-e7bacef4ecf2@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113092001.1344151-1-christian.bruel@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v2] phy: stm32: Optimize tuning values
	from DT.
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

Hi Christian,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/phy-stm32-Optimize-tuning-values-from-DT/20250113-172435
base:   v6.13-rc7
patch link:    https://lore.kernel.org/r/20250113092001.1344151-1-christian.bruel%40foss.st.com
patch subject: [PATCH v2] phy: stm32: Optimize tuning values from DT.
config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171619.0XDYDyBZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501171619.0XDYDyBZ-lkp@intel.com/

New smatch warnings:
drivers/phy/st/phy-stm32-combophy.c:147 stm32_impedance_tune() error: buffer overflow 'imp_lookup' 8 <= 8 (assuming for loop doesn't break)
drivers/phy/st/phy-stm32-combophy.c:564 stm32_combophy_probe() warn: passing zero to 'dev_err_probe'

vim +147 drivers/phy/st/phy-stm32-combophy.c

31219ca5436f01 Christian Bruel 2025-01-13  119  static void stm32_impedance_tune(struct stm32_combophy *combophy)
47e1bb6b4ba098 Christian Bruel 2024-09-30  120  {
47e1bb6b4ba098 Christian Bruel 2024-09-30  121  	u8 imp_of, vswing_of;
2de679ecd724b8 Arnd Bergmann   2024-11-11  122  	u32 regval;
47e1bb6b4ba098 Christian Bruel 2024-09-30  123  
31219ca5436f01 Christian Bruel 2025-01-13  124  	if (combophy->microohm) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  125  		regval = 0;
2de679ecd724b8 Arnd Bergmann   2024-11-11  126  		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
31219ca5436f01 Christian Bruel 2025-01-13  127  			if (imp_lookup[imp_of].microohm <= combophy->microohm) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  128  				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
47e1bb6b4ba098 Christian Bruel 2024-09-30  129  				break;
2de679ecd724b8 Arnd Bergmann   2024-11-11  130  			}
2de679ecd724b8 Arnd Bergmann   2024-11-11  131  		}

If we don't hit the break sttaement above

47e1bb6b4ba098 Christian Bruel 2024-09-30  132  
47e1bb6b4ba098 Christian Bruel 2024-09-30  133  		dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
47e1bb6b4ba098 Christian Bruel 2024-09-30  134  			imp_lookup[imp_of].microohm);
                                                                                   ^^^^^^
Then this is an out of bounds access.

47e1bb6b4ba098 Christian Bruel 2024-09-30  135  
47e1bb6b4ba098 Christian Bruel 2024-09-30  136  		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
47e1bb6b4ba098 Christian Bruel 2024-09-30  137  				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
2de679ecd724b8 Arnd Bergmann   2024-11-11  138  				   regval);
47e1bb6b4ba098 Christian Bruel 2024-09-30  139  	} else {
31219ca5436f01 Christian Bruel 2025-01-13  140  		/* default is 50 ohm */
31219ca5436f01 Christian Bruel 2025-01-13  141  		imp_of = 3;
47e1bb6b4ba098 Christian Bruel 2024-09-30  142  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  143  
31219ca5436f01 Christian Bruel 2025-01-13  144  	if (combophy->microvolt) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  145  		regval = 0;
2de679ecd724b8 Arnd Bergmann   2024-11-11  146  		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
31219ca5436f01 Christian Bruel 2025-01-13 @147  			if (imp_lookup[imp_of].vswing[vswing_of] >= combophy->microvolt) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  148  				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
47e1bb6b4ba098 Christian Bruel 2024-09-30  149  				break;
2de679ecd724b8 Arnd Bergmann   2024-11-11  150  			}
2de679ecd724b8 Arnd Bergmann   2024-11-11  151  		}
47e1bb6b4ba098 Christian Bruel 2024-09-30  152  
47e1bb6b4ba098 Christian Bruel 2024-09-30  153  		dev_dbg(combophy->dev, "Set %u microvolt swing\n",
47e1bb6b4ba098 Christian Bruel 2024-09-30  154  			 imp_lookup[imp_of].vswing[vswing_of]);
47e1bb6b4ba098 Christian Bruel 2024-09-30  155  
47e1bb6b4ba098 Christian Bruel 2024-09-30  156  		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
47e1bb6b4ba098 Christian Bruel 2024-09-30  157  				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
2de679ecd724b8 Arnd Bergmann   2024-11-11  158  				   regval);
47e1bb6b4ba098 Christian Bruel 2024-09-30  159  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  160  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
