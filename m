Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F4A579F5
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Mar 2025 12:17:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33B16C78F67;
	Sat,  8 Mar 2025 11:17:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70DF8C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Mar 2025 11:17:06 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43bd5644de8so29759715e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Mar 2025 03:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741432626; x=1742037426;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xnnNqxownKeU3GNDrkJTrs8uiEmC7dJ+ZmSVhNEpneo=;
 b=ypxonluwp8eIoX+jPnoiRsJSE1yEsy8LT+mufdeeJJUNq4e+HMpXG5PZ78xFDpisZ5
 3PTBIvl3TEQ+E0y/sUhr3/HUVC4vDGsSAurJ1C2Ngecf0KQLrISgw0LY8k/aSF7JyvOc
 zAfcXjDYG+/mvmrNuPDA+JILSRg95XFBRcx3oYJg6RttoXShVrT41sAmZAJow6/mI1rv
 +Gu7JiCVZgnsE/6TbQyQO+hrZN5IzHAe7w8bEaw8YFp0A6FcQjeJsdKgJU/mMkhA2bjO
 QA1lJdUEsPbiwtrH54O/S37+QanSJOm5Bbl2DQfnf9l1lubCHAa5TnRoSn/gcRXut9Ki
 i62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741432626; x=1742037426;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xnnNqxownKeU3GNDrkJTrs8uiEmC7dJ+ZmSVhNEpneo=;
 b=LH9TDz8tZ+aD6uQASCRXEJGlBYD0MYlUu7EuZ3rKPFYfcKiqe+TwBYZseN4fkt+WVj
 fkrCJ+c/opHgbzR5ZzQoi3vYJLSY5vruouv6uksHmrrsAdpLdKdD0wd5qBdgW2jv2M5C
 bZmp9mUwC51qquEBY+1dXyfItGunL38SnTG9e2oHjX55/AuajJ+5n5IsLcUIwNTe465l
 iTAVV8DGTbemxgESp5p3PmaKmvCmw84mpIRNadETjNFmv/EewHqCAjUhQs0S7SSeakWg
 czCw8TyTQCDeZjioLvaLItkDcxSdRpl1xLdcEnT//HUGdXDcoQKGRcdPm39+KqBUUULQ
 P3pA==
X-Gm-Message-State: AOJu0Yw3Gfl9VD9eQ9JCm6Vy4i93Gf/Du2LX7RZy4lr4Ukb/R7LxDkcc
 n0i2XGdeaboQaICw1ip9+4kdX84ql4M3aR5aALecdTLgy5eujaOx20DzaqPTtdg=
X-Gm-Gg: ASbGnctfhvMNM/N/gYAFwUYBAO44qPEJv3VTuI61mfLe8mI1sD3J963q1GJs6968DQQ
 LmqATI5NZBcHtjpQOzOdKYQgvc5iOWcJhrY2Z6P0CVfPhX4RWt5QKPRsJTRrNjHxGBr/e0PehL1
 mg/5MRcc7BMA9ZykV6vly1ZPZTBHSdFZuTGWp+BcSuyeKV1SNEJaNma9kYmd1k8dgfO9DjN7cRr
 Dh6bHElxTjX3hGRhLo0Y6TUpR8i60vma/FLCyP6e8+MrTUzJB169B5pKvXtPJ08wrrxjyC0YR2m
 +AVxWXRPZMPICnTpx+RSkiq/LkrDfvbvB2nu7bnXoykte0UrKQ==
X-Google-Smtp-Source: AGHT+IHgPy2ipS9U13tlaxW/er4uS9dL0vgcgs/ixqt3JyEdpvktSnhmqJQ1s8kCsjFpv/J/9JwBaQ==
X-Received: by 2002:a05:6000:1fa9:b0:391:212:459a with SMTP id
 ffacd0b85a97d-39132d3b46fmr6741762f8f.22.1741432625810; 
 Sat, 08 Mar 2025 03:17:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c015d1csm8339913f8f.44.2025.03.08.03.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Mar 2025 03:17:05 -0800 (PST)
Date: Sat, 8 Mar 2025 14:17:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <677ffce5-0d76-4b97-abd3-1ac7608417f3@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [bug report] net: stmmac: configure SerDes according
 to the interface mode
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

Hello Choong Yong Liang,

Commit a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the
interface mode") from Feb 27, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:497 intel_tsn_lane_is_available()
	warn: missing error code? 'ret'

drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
    472 static int intel_tsn_lane_is_available(struct net_device *ndev,
    473                                        struct intel_priv_data *intel_priv)
    474 {
    475         struct stmmac_priv *priv = netdev_priv(ndev);
    476         struct pmc_ipc_cmd tmp = {};
    477         struct pmc_ipc_rbuf rbuf = {};
    478         int ret = 0, i, j;

Better to avoid initializing ret so that bug show up as uninitialized
variables.

    479         const int max_fia_regs = 5;
    480 
    481         tmp.cmd = IPC_SOC_REGISTER_ACCESS;
    482         tmp.sub_cmd = IPC_SOC_SUB_CMD_READ;
    483 
    484         for (i = 0; i < max_fia_regs; i++) {
    485                 tmp.wbuf[0] = R_PCH_FIA_15_PCR_LOS1_REG_BASE + i;
    486 
    487                 ret = intel_pmc_ipc(&tmp, &rbuf);
    488                 if (ret < 0) {
    489                         netdev_info(priv->dev, "Failed to read from PMC.\n");
    490                         return ret;
    491                 }
    492 
    493                 for (j = 0; j <= intel_priv->max_tsn_lane_regs; j++)
    494                         if ((rbuf.buf[0] >>
    495                                 (4 * (intel_priv->tsn_lane_regs[j] % 8)) &
    496                                         B_PCH_FIA_PCR_L0O) == 0xB)
--> 497                                 return ret;

This should probably be return -EINVAL, right?

    498         }
    499 
    500         return ret;

It's more clear to just return 0 for the success path.  Otherwise you
have to read the code a bit.

    501 }

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
