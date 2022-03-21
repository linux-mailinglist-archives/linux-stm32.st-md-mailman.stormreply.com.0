Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D50C14E1FAA
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Mar 2022 05:57:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D6A8C5EC6B;
	Mon, 21 Mar 2022 04:57:41 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41185C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Mar 2022 04:57:39 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so13405437pjp.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Mar 2022 21:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YLwShMZpFVnttuqvEbdrkmmsS2bGXBfGBiSI2Uo2yco=;
 b=TpTUiczvhMBuZwTGPVhmDTRUbN1/0RAcJBgl6ZMwoyjWAUjV/T1yttZ2XtExcNES37
 ot9N1RZraiX1CofYXH4B/3oIFhyfe4CRUdbcuuhMyq9AFSaiZAgBgFsbmt16ax9XlaFM
 6vcb7QiKjmFJc9qWFMyvJFSHJrNv5v4Bwr0osGJDX0aLvcE1zU8uhAJjyOuy9i0+B2MA
 hwoL9xiGV6NFNSlnBz6X7lY0YEZuPrhcSlcvLTQjURne87KF3GIZn37VUGKyyWfBGjIB
 /7D8tVgVYaodGzRq9aCIO9+/A2W3hnngLS9kGhhFDUR13nDf7BVRY0fkmOEeeQokz3HF
 PK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YLwShMZpFVnttuqvEbdrkmmsS2bGXBfGBiSI2Uo2yco=;
 b=B+iXpbePjsHcHyZkDhx1wu4qUTPFunV7/RnxQ23bZjShHHa8zOSdtJ1NvNEccbwbg8
 pIUBnsIirmiSMPe3aDJZw41oF11dPg60WiM5H/CrTbcOUNvOkNT4okApxVNlGlw2Ty2d
 FN31FQ52v4Jx97TkDF4KctCDq1iUdEoku8WL8WiE4bmlu6P7wuEU+TgmtU1XnJTizTb6
 nTYI9bks/yG0/oMVbbivN2jMJcrTpTQfY2dJvO26t8N/Brl8CGxB+Tea+GSaGhr4boQi
 3z2oU/1vZoYzfQVFNnh9Wm3TtP4JauURuA9KUfmnmX7JRA+mh2TesnKu6bxP8dShUPOy
 7FyQ==
X-Gm-Message-State: AOAM5306sOX6jB4uZB2PU+i4sMEAQXz/ghjMxvgbRQbIoeg+8V7ns7s/
 NiWLD80AWCJWGcB0HitCSOY=
X-Google-Smtp-Source: ABdhPJy2QKuXkIMIpb6OZyTCemvsSgDY73bTi2uKa1E5rbRhlkD5fLusyOwSbP8pyLxk6aQU3aRkYA==
X-Received: by 2002:a17:90b:3807:b0:1bf:6c8e:f9b7 with SMTP id
 mq7-20020a17090b380700b001bf6c8ef9b7mr24357499pjb.16.1647838657418; 
 Sun, 20 Mar 2022 21:57:37 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:31f6:c8f1:6f10:b2ec])
 by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm13304028pgb.73.2022.03.20.21.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 21:57:36 -0700 (PDT)
Date: Sun, 20 Mar 2022 21:57:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Message-ID: <YjgFvv5uVC42J1aY@google.com>
References: <20220317131604.53538-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220317131604.53538-1-zhengyongjun3@huawei.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Input: fix reference leak in
	stmfts_input_open
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

On Thu, Mar 17, 2022 at 01:16:04PM +0000, Zheng Yongjun wrote:
> pm_runtime_get_sync() will increment pm usage counter even it
> failed. Forgetting to call pm_runtime_put_noidle will result
> in reference leak in stmfts_input_open, so we should fix it.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
