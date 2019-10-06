Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFABCD8C4
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2019 21:00:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A44D7C36B0B;
	Sun,  6 Oct 2019 19:00:21 +0000 (UTC)
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 014B7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2019 19:00:20 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id x65so4292574ywf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Oct 2019 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Us0YKrblQgRWQeQuWKfageTMytCoGjV6GZJUa8EZKdM=;
 b=vCBiJc2l54U+LpFa1SuZysYnPwwhlPxepmSDVBJYMdVb6Q7hWJbhJ6eSk63Jnb5TK2
 7+gUjyeZAjWdiXGXKgcylByeMsqKQVjAGQQeWPN5wsj3o+BkrZd3YceuFfxhWuXlGrdH
 lOicOIy3jZVhGEe9IrQnww/T38JLbfkVl88LLh/JSwcd5NS+axKNag6QRJEHSa3KsBsc
 Wny1HAeTld1/jLWNuEgFaR/IyBuCCQd9ahnN4tg398OslAV9sH1rmKfPO/SQOt1pDRbd
 N44zn8xCkvmaY8LpqKnGP9Hl2ByQ+I8+v0veA3xCahyZPEaBRw+7o0DyV3sU03DcQhmX
 /wHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Us0YKrblQgRWQeQuWKfageTMytCoGjV6GZJUa8EZKdM=;
 b=Q9ZXHu0sDrUuPzZidlokJr3gvmS2GQOoe/gLwVqGrvOAmbvI6qIGAW3OdE8KSxfLKT
 THghJrJx5lccweAWcf/CJvb6yUV1T8Chr2RQcqoi2L+mLirrw6OLfNX38NoSgIBwlEF8
 QORCReewcIcQaaVAfxFyy/x21t7F2Pg5+hOmfE9MlJI+jqfmkf4g9rNOp1OdoRw0G1CK
 1Rai/plAPmdj95ONLexZPTqR53U5k5YWRa61yQTr2q0QZw/I0i4j0O+BWwobyTf3cN1k
 VoDGu4z7IPMX0fPeFg057Cm30d6k/ecARpAdiyy4gFtky4wqDg6w0t3MmPeeyp7RFPpG
 Afgw==
X-Gm-Message-State: APjAAAXh0C/pyMunJiE9GdlAmv5s7lp7LvbpV0Smyw4jEBBtm3Zj2ppk
 +Gw8A8IZ32oa3f/y7s51stg=
X-Google-Smtp-Source: APXvYqwdTQIpeCuBbpBgsgUkoMbPKwFrUZ55vm0hSSmZPHtZGSP1k/+YTPKGlaAuUOJDEyzp13hpmQ==
X-Received: by 2002:a81:178f:: with SMTP id 137mr18588158ywx.487.1570388419603; 
 Sun, 06 Oct 2019 12:00:19 -0700 (PDT)
Received: from icarus (072-189-084-142.res.spectrum.com. [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id j17sm3315602ywa.71.2019.10.06.12.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 12:00:18 -0700 (PDT)
Date: Sun, 6 Oct 2019 15:00:04 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20191006190004.GA109365@icarus>
References: <cover.1570377521.git.vilhelm.gray@gmail.com>
 <75a9ca9837f4d66cb4912cfa535176e27f7c219a.1570377521.git.vilhelm.gray@gmail.com>
 <9850a671-2822-24b7-3c22-b4abbd6a6b37@lechnology.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9850a671-2822-24b7-3c22-b4abbd6a6b37@lechnology.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: benjamin.gaignard@linaro.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 2/2] docs: driver-api: generic-counter:
 Update Count and Signal data types
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

On Sun, Oct 06, 2019 at 01:41:42PM -0500, David Lechner wrote:
> On 10/6/19 11:03 AM, William Breathitt Gray wrote:
> > Count data is now always represented as an unsigned integer, while
> > Signal data is either SIGNAL_LOW or SIGNAL_HIGH.
> > 
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> >   Documentation/driver-api/generic-counter.rst | 22 +++++++-------------
> >   1 file changed, 8 insertions(+), 14 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
> > index 8382f01a53e3..161652fc1025 100644
> > --- a/Documentation/driver-api/generic-counter.rst
> > +++ b/Documentation/driver-api/generic-counter.rst
> > @@ -39,10 +39,7 @@ There are three core components to a counter:
> >   COUNT
> >   -----
> >   A Count represents the count data for a set of Signals. The Generic
> > -Counter interface provides the following available count data types:
> > -
> > -* COUNT_POSITION:
> > -  Unsigned integer value representing position.
> > +Counter interface represents the count data as an unsigned integer.
> 
> The previous patch looks like it is using unsigned long instead of
> unsigned integer.

Thank you for the heads-up. Actually, this section of the
documentation describes the theoretical representation of counter
devices, as opposed to the in-kernel implementation of the Generic
Counter interface. As such, the phrase "unsigned integer" here means a
natural number and not the C language "unsigned int" data type.

I'm going to update this line to state that clearer since it can be
easily confused in the context of the rest of the document.

William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
