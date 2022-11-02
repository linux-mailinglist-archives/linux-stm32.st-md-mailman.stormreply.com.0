Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C31617227
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Nov 2022 00:22:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75276C04003;
	Wed,  2 Nov 2022 23:22:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FF37C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 23:22:35 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d24so308873pls.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Nov 2022 16:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AdoFh8YVkv5zUPXXAnzyzyEOTwd2Q0UanZEkn/ydxvw=;
 b=j+g0ow4na4Oo4d9VS2DhHEabxP+3YX8dGdUXf69heIBe5MasAqMyAVtyc/55oXxFsl
 keJ8Naw/uZFcKMhItnWoCg1ZRoBANiS+ulRBy6DvzVCKoLcXp7Qbc1I/IMqHMUy48GgK
 29kf/jymVZAiWD/8o1z6wCWdxrcwJpVf9TgUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdoFh8YVkv5zUPXXAnzyzyEOTwd2Q0UanZEkn/ydxvw=;
 b=nkG0Sa49u7VMJpwhUwY68jjnPxG2oBJ+AGR1pJGylMEAeJcC/mUyGdDu6YgVd+tk+1
 LC0ZVky8rJZI0sCWxx9hVDWX3cr/BYOKG5LzhuByQt3p0F+T4+9TBBj53uU0DvcZBkAU
 jj38QeI55gVFbYcDh9VVmSaLibmuhGVK1imuxlq7BCtfQI7mbYJ+CgHfJksumZjFdIO5
 fFNlh4nPjeIPIg36JwWnmOTjp4mlS8j9QTLVYAllXDMqRSoUd9jzSbjO14A4lk9uR6rW
 RtDgkqpBh95El9jQsd4cyUuaOVjbQ63auTB84kOIfdCHij241OO7eAeogWW65efPbaiF
 ZwOA==
X-Gm-Message-State: ACrzQf2X2CB+BpXx/CcsuHkQoLN0VihryDHbtxVfvD4Qv715ejaK4MoE
 RVzPgJvaSlZnumlty34HwtIhoA==
X-Google-Smtp-Source: AMsMyM4JtgQhibbMD7ppeuCJgVgRX+k/QVskw2MC6WOXTO1ktCkcW6tWpFxpS30oJibYAYYYsnDRqA==
X-Received: by 2002:a17:90b:1982:b0:212:fe7f:4a49 with SMTP id
 mv2-20020a17090b198200b00212fe7f4a49mr45691324pjb.156.1667431353734; 
 Wed, 02 Nov 2022 16:22:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a17090a348a00b0020d9df9610bsm1994104pjb.19.2022.11.02.16.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:22:33 -0700 (PDT)
Date: Wed, 2 Nov 2022 16:22:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Message-ID: <202211021621.34241DC39@keescook>
References: <20221102172217.2860740-1-nathan@kernel.org>
 <202211021216.FF49E84C69@keescook>
 <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>
Cc: linux-omap@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>,
 William Breathitt Gray <william.gray@linaro.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Julien Panis <jpanis@baylibre.com>, David Lechner <david@lechnology.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] counter: Adjust final parameter type
 in function and signal callbacks
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

On Wed, Nov 02, 2022 at 01:23:51PM -0700, Nathan Chancellor wrote:
> On Wed, Nov 02, 2022 at 12:21:23PM -0700, Kees Cook wrote:
> > On Wed, Nov 02, 2022 at 10:22:14AM -0700, Nathan Chancellor wrote:
> > > The ->signal_u32_read(), ->count_u32_read(), and ->count_u32_write()
> > > callbacks in 'struct counter_comp' expect the final parameter to have a
> > > type of 'u32' or 'u32 *' but the ops functions that are being assigned
> > > to those callbacks have an enumerated type as the final parameter. While
> > > these are compatible from an ABI perspective, they will fail the
> > > aforementioned CFI checks.
> > > 
> > > Adjust the type of the final parameter in the ->signal_read(),
> > > ->function_read(), and ->function_write() callbacks in 'struct
> > > counter_ops' and their implementations to match the prototypes in
> > > 'struct counter_comp' to clear up these warnings and CFI failures.
> > 
> > I don't understand these changes. Where do 'struct counter_comp'
> > and 'struct counter_ops' get confused? I can only find matching
> > ops/assignments/calls, so I must be missing something. This looks like
> > a loss of CFI granularity instead of having wrappers added if there is
> > an enum/u32 conversion needed somewhere.
> 
> Right, I am not the biggest fan of this change myself and it is entirely
> possible that I am misreading the warnings from the commit message but I
> do not see how
> 
>         comp_node.comp.signal_u32_read = counter->ops->signal_read;
> 
> and
> 
>         comp_node.comp.count_u32_read = counter->ops->function_read;
> 
> in counter_add_watch(),
> 
>         comp.signal_u32_read = counter->ops->signal_read;
> 
> in counter_signal_attrs_create(), and
> 
>         comp.count_u32_read = counter->ops->function_read;
>         comp.count_u32_write = counter->ops->function_write;
> 
> in counter_count_attrs_create() are currently safe under kCFI, since the
> final parameter type of the prototypes in 'struct counter_ops' does not
> match the final parameter type of the prototypes in 'struct
> counter_comp'. I would expect the indirect calls in counter_get_data()
> and counter_comp_u32_show() to fail currently.
> 
> I briefly looked at making the 'struct counter_comp' callbacks match the
> 'struct counter_ops' ones but the COUNTER_COMP macros in
> include/linux/counter.h made it seem like these callbacks might be used
> by implementations that might use different enumerated types as the
> final parameter. I can look a little closer to see if we can make
> everything match.
> 
> I am not sure how wrappers would work here, I can take a look into how
> feasible that is.

How about this? (I only did signal_read -- similar changes are needed
for function_read and function_write:

diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter-chrdev.c
index 80acdf62794a..cb391b2498a6 100644
--- a/drivers/counter/counter-chrdev.c
+++ b/drivers/counter/counter-chrdev.c
@@ -38,6 +38,7 @@ struct counter_comp_node {
 	a.device_u32_read == b.device_u32_read || \
 	a.count_u32_read == b.count_u32_read || \
 	a.signal_u32_read == b.signal_u32_read || \
+	a.signal_read == b.signal_read || \
 	a.device_u64_read == b.device_u64_read || \
 	a.count_u64_read == b.count_u64_read || \
 	a.signal_u64_read == b.signal_u64_read || \
@@ -54,6 +55,7 @@ struct counter_comp_node {
 	comp.device_u32_read || \
 	comp.count_u32_read || \
 	comp.signal_u32_read || \
+	comp.signal_read || \
 	comp.device_u64_read || \
 	comp.count_u64_read || \
 	comp.signal_u64_read || \
@@ -320,7 +322,7 @@ static int counter_add_watch(struct counter_device *const counter,
 			return -EINVAL;
 
 		comp_node.comp.type = COUNTER_COMP_SIGNAL_LEVEL;
-		comp_node.comp.signal_u32_read = counter->ops->signal_read;
+		comp_node.comp.signal_read = counter->ops->signal_read;
 		break;
 	case COUNTER_COMPONENT_COUNT:
 		if (watch.component.scope != COUNTER_SCOPE_COUNT)
@@ -530,6 +532,7 @@ static int counter_get_data(struct counter_device *const counter,
 	const size_t id = comp_node->component.id;
 	struct counter_signal *const signal = comp_node->parent;
 	struct counter_count *const count = comp_node->parent;
+	enum counter_signal_level level = 0;
 	u8 value_u8 = 0;
 	u32 value_u32 = 0;
 	const struct counter_comp *ext;
@@ -569,8 +572,8 @@ static int counter_get_data(struct counter_device *const counter,
 			ret = comp->device_u32_read(counter, &value_u32);
 			break;
 		case COUNTER_SCOPE_SIGNAL:
-			ret = comp->signal_u32_read(counter, signal,
-						    &value_u32);
+			ret = comp->signal_read(counter, signal, &level);
+			value_u32 = level;
 			break;
 		case COUNTER_SCOPE_COUNT:
 			ret = comp->count_u32_read(counter, count, &value_u32);
diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
index b9efe66f9f8d..07ce2543b70d 100644
--- a/drivers/counter/counter-sysfs.c
+++ b/drivers/counter/counter-sysfs.c
@@ -170,6 +170,7 @@ static ssize_t counter_comp_u32_show(struct device *dev,
 	const struct counter_attribute *const a = to_counter_attribute(attr);
 	struct counter_device *const counter = counter_from_dev(dev);
 	const struct counter_available *const avail = a->comp.priv;
+	enum counter_signal_level level = 0;
 	int err;
 	u32 data = 0;
 
@@ -178,7 +179,8 @@ static ssize_t counter_comp_u32_show(struct device *dev,
 		err = a->comp.device_u32_read(counter, &data);
 		break;
 	case COUNTER_SCOPE_SIGNAL:
-		err = a->comp.signal_u32_read(counter, a->parent, &data);
+		err = a->comp.signal_read(counter, a->parent, &level);
+		data = level;
 		break;
 	case COUNTER_SCOPE_COUNT:
 		if (a->comp.type == COUNTER_COMP_SYNAPSE_ACTION)
@@ -842,7 +844,7 @@ static int counter_signal_attrs_create(struct counter_device *const counter,
 
 	/* Create main Signal attribute */
 	comp = counter_signal_comp;
-	comp.signal_u32_read = counter->ops->signal_read;
+	comp.signal_read = counter->ops->signal_read;
 	err = counter_attr_create(dev, cattr_group, &comp, scope, signal);
 	if (err < 0)
 		return err;
diff --git a/include/linux/counter.h b/include/linux/counter.h
index c41fa602ed28..3f1516076f20 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -169,6 +169,9 @@ struct counter_comp {
 				      struct counter_count *count, u32 *val);
 		int (*signal_u32_read)(struct counter_device *counter,
 				       struct counter_signal *signal, u32 *val);
+		int (*signal_read)(struct counter_device *counter,
+				   struct counter_signal *signal,
+				   enum counter_signal_level *level);
 		int (*device_u64_read)(struct counter_device *counter,
 				       u64 *val);
 		int (*count_u64_read)(struct counter_device *counter,

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
