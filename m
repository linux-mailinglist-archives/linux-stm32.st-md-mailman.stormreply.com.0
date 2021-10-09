Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E94274AA
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Oct 2021 02:30:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6961BC5C824;
	Sat,  9 Oct 2021 00:30:45 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 573F3C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Oct 2021 00:30:42 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id y207so12712525oia.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 17:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d4DYf1R/vHJuoHLrKKzqNGOP7fMfeO41/+lqHM0JUWw=;
 b=NcqhTehlNQIE4ojmKb0Fz6gj86Xczjmlc1UIDNdMn+rcHkTEFAUAAmu0ZcuQJ6bUIe
 L8Rfc7D2EXu3xONNMZai+qF9VP11tf3aWnCzi3bNiEjIgZ0y48fZuvncxF+4pUjEfqmQ
 4Uk1ceSmojObtxFwpN1GKeoQyjTpQO/VCSdDntDKLFXbKg7AWrrPksNpdGuGdMd0/s21
 vxfCMWGB89iWWkZ9tPRhsgm/2KAPqezalI4216yADegGECUX/CdhJC4ElUXiWiNSvH/u
 nPpimbZz+u57FyWH2JrjWQkzRqLAWHzCkjHUCD3A77QM/ThOFr3AroLVPWikz5S93Jh8
 r0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d4DYf1R/vHJuoHLrKKzqNGOP7fMfeO41/+lqHM0JUWw=;
 b=A6Z631F/MKqGCe08EDjn26nH/eztJTQ7UVuueuYNUpwRXQpsmqRJ7+gdKqXpFsrdUy
 vCPVmy6jVpkJg5lW7pZ1DpVVIC2/EZ1RsVYxIej3E6bRA+GrmdBdb0rTdLwcDPb9HSTn
 HjaDQG9c/Fbr9DZSOfnfoTlPdaJmV2JYKZG10FO1BVNKpKhVoSz1aVa5Rc2Ow44h1Kg2
 Mi+oMnO58cDADbFnqXr7pG/J/EOyUE1933mhkhBVlGZ7f2v8EjK0Q6SF4vtD7TXRhZKt
 YmMsfD2VQJgmsUYbo47m8irMqQljKKiwDZmjhGseDtY/4nLDMRo/NGQoPPttP8Vp07CN
 8/Lw==
X-Gm-Message-State: AOAM533uGJuTwKKSHZQR5gB3V3/nNDu3f00ybB3luZ2YVZis4vnTh0O6
 24HqT//K+aXafftvFOXX/g5SKQ==
X-Google-Smtp-Source: ABdhPJwCo9rdFuljZRiPw/CyTmJn1aBYUt1MYPu85j5RF41FR5MrjWqTV1/C4eKIrAhu7oTEqozLuw==
X-Received: by 2002:aca:4007:: with SMTP id n7mr19529750oia.174.1633739441683; 
 Fri, 08 Oct 2021 17:30:41 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id bh39sm267605oib.37.2021.10.08.17.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 17:30:41 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri,  8 Oct 2021 19:30:39 -0500
Message-Id: <163373942992.719534.404561077896393426.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712123752.10449-2-arnaud.pouliquen@foss.st.com>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH v5 1/4] rpmsg: char: Remove
	useless include
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

On Mon, 12 Jul 2021 14:37:49 +0200, Arnaud Pouliquen wrote:
> No facility requests the include of rpmsg_internal.h header file.
> 
> 

Applied, thanks!

[1/4] rpmsg: char: Remove useless include
      commit: bc774a3887cb513be08e846726bc4402897b267a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
