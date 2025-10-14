Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D976BD90AB
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 13:31:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75F05C3FACE;
	Tue, 14 Oct 2025 11:31:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F06FCC35E3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 11:31:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso45445525e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760441509; x=1761046309;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ofkJNulQu/wtU9ucbaTHhfLlEv5BRzrjhZDncPD/y2M=;
 b=wCk89sehbqpgNr+6nRFu5km+N0XXZX0fpG6jxTifYFDOH6AYrPWf/X91RGPygMPIf3
 mY1VO10m36z5aTB2hcwS3JNJFaJcVM0KC0k0riGfLz3btkcU3XCpS4tFQuE0VVIbvtDT
 MMxe41GXxxrYHX2zshFFdlNQguWo/xNAGMZgLIMtGuP5kGoUs9QAYJGa2E/JP8nVmgc+
 85RVibx5aYKgKcB03mIEdvRnVJEMfJUryXcbBtOXvQKEpJdxKH3dQLZve6kPRPOjgff+
 eNO1O/kGW/or0H1sm+yMBGY/xDawpBiKioMKEV+2akTMN2FvE1wUu+OwPTSjUPKkTYPH
 dDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760441509; x=1761046309;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ofkJNulQu/wtU9ucbaTHhfLlEv5BRzrjhZDncPD/y2M=;
 b=v+Qd4gzLa8m3qeBPJBQAU41+wcLy6lhgpv9HR7V/myZG3thwlYNg7IoabMwvCZzofv
 wfav7III0lS0ouhSVzNV+xd01jim7RKVI+VXeP2Emzk0dAXZOEQtB+LkJw+nN4ddlfRx
 jwRsRSCpLHQv3l4mTs1f/JEkTA7xMwOLTnm1LcumoVCz6dqZpmKvDtqaY/+eDDPjsph3
 rRV3pijp8s0VsUjKqrAJnONV4EoTswPojH6J0GCFJxyc3b2CNADhz3A3sv7DYIeNnpLv
 J4tGxBbkGsMG2/7nxkneistAOciRXkLfaKNcEETbXm14AiaP7EEtlIBjrFy/5+p0gtOP
 +v9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWtceUH+yKtY2VoudTXCfa6ctmvuO+HDWFcsePfautoIfCiRYpwadPqkDzJ4MwLSOcKmaKKz+zn5EOlw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx8yb/JmubTPLPsCy0teDvgf/jOsEpjfc5tvPKW9SOtONa2ZVhB
 wb81SDwPDC5t1kuWEPc2drF6gs9Qx2xWyjzqA5bKBw52M8afbic/N+qjkoKEtUEEkFw=
X-Gm-Gg: ASbGncvnqbwMeN/vpAcZHFNBvDvOJOTpjO6GjPu9g+VtFOW7yBBntYz95af0S+Q5Ika
 hePJatwcxr4kRnV8DPJNf9Uylq6M3QEAHlb3Elk/J4LBJGD7ajD2934vCHAr9Ke6OQWRXbNSnhD
 SPaosdTHs5RYuKQqrYjDw4Z73RwrGhAE3S+3ezLT5HPDRoG/gNC8yzo6ljxk/jN7820srtRSbjS
 81+SBjRenr7/UyEYRn10oNmzurRDR37JH3vCPlos+3tECv5BMffAhXyt0bvfBUlCh35jtJ8UTQd
 WZ6nqR1DNyiA7GUK8eV6+h1S5o9SDmHWSUiX8EXr/kMbZdc8I7W7mkZZx1SeiNHI1kScaW3O0Xb
 Ex0Fo9KNOol3ciGt4gD3PpdUkDwNvDbe0FELQ7pddd4fjNWSfsgg=
X-Google-Smtp-Source: AGHT+IE7JRJVgX/0XRZqqgOQ0IMTJn2bfv2E4RS1BB14d24blTgxq9Or2UqVDIrAHI/wbElOafShvQ==
X-Received: by 2002:a05:6000:43c7:20b0:426:f355:7c9a with SMTP id
 ffacd0b85a97d-426f3557ce6mr628338f8f.25.1760441509084; 
 Tue, 14 Oct 2025 04:31:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46fb49c4027sm234419565e9.17.2025.10.14.04.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 04:31:48 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:31:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Message-ID: <aO40oQkj9sT78bMV@stanley.mountain>
References: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
 <202510121908.7aduLIkw-lkp@intel.com>
 <20251014104511.GA14479@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014104511.GA14479@nxa18884-linux.ap.freescale.net>
Cc: Peng Fan <peng.fan@nxp.com>, oe-kbuild@lists.linux.dev,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 Andrew Davis <afd@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 lkp@intel.com
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

On Tue, Oct 14, 2025 at 06:45:11PM +0800, Peng Fan wrote:
> Hi Dan,
> 
> I am not sure, Is this false alarm?
> 
> On Tue, Oct 14, 2025 at 11:39:41AM +0300, Dan Carpenter wrote:
> >Hi Peng,
> >
> >
> >vim +/ret +1841 drivers/remoteproc/remoteproc_core.c
> >
> >70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1829  int rproc_trigger_recovery(struct rproc *rproc)
> >70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1830  {
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1831  	struct device *dev = &rproc->dev;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1832  	int ret;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1833  
> >c42baf6f84c7694 Peng Fan             2025-10-10  1834  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
> >c42baf6f84c7694 Peng Fan             2025-10-10  1835  	ret = ACQUIRE_ERR(mutex_intr, &lock);
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1836  	if (ret)
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1837  		return ret;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1838  
> >0b145574b6cd2b3 Alex Elder           2020-02-28  1839  	/* State could have changed before we got the mutex */
> >0b145574b6cd2b3 Alex Elder           2020-02-28  1840  	if (rproc->state != RPROC_CRASHED)
> >c42baf6f84c7694 Peng Fan             2025-10-10 @1841  		return ret;
> >
> >Please change this to either "return 0;" or "return -ERRORCODE;"
> 
> ACQUIRE_ERR should already returns 0. This change does not change the
> assignment to ret as my understanding. Please help to see if this is false
> alarm or I miss something?
> 

I guess if this was already merged then it's fine.  But "return ret" looks
like an error path where "return 0;" is obvious.  This code will always
trigger a Smatch warning, and I always tell people that old code has been
reviewed so all the warnings are false positives, still someone will
eventually change this to "return -EINVAL;" because it looks so much like
a mistake.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
