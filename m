Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADB078D37F
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Aug 2023 09:15:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C06EC6A617;
	Wed, 30 Aug 2023 07:15:49 +0000 (UTC)
Received: from out203-205-251-59.mail.qq.com (out203-205-251-59.mail.qq.com
 [203.205.251.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46CC5C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 00:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693270062;
 bh=LxUutieyTDutRI1JM5YEeCPiPo1Dpb9gHQrtgvK0grI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=koIrWq6cwt0dYLGXnXiBA9XbHAWYLFoasGNfCdo7VacjfLWZdlINsJRtpZBUmMDwJ
 +6vKi7rNlANRMz5uhtGlJQx2lskLAJJg8xXuRtAMLcn+a6f0mDpQ+OJVkj0Gt3qVzl
 PONwmmLrJ8d5TFbFu5ThaAEVQl91VWooW0j77wQk=
Received: from localhost.localdomain ([39.156.73.12])
 by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
 id BE3B6E68; Tue, 29 Aug 2023 08:47:35 +0800
X-QQ-mid: xmsmtpt1693270055tucwvy5he
Message-ID: <tencent_F746AF27A3E588BF061F427F59F9979A2A08@qq.com>
X-QQ-XMAILINFO: MGSlRwRrdVfIisT3TiXB4uYFg1pb70VmVj01DWlSdnyXveEPvcdfOti4Q7+mlg
 3vm370upAN81LRC9/x3JRq4rGtFv69eq7BpBUc1EIO+ezuZzWYVks3EJByyg33EydPy8vrJgieNS
 2Z6R9SZeFE0PPT1HDn6njhxKOuw48AlXhRpqKEmqSywXA8XjPOoqEiGgdqOlQac+iLAKxljaBvJo
 hF2RrRCPHzbv8DGPEAg9L6I5jCgZf6ZyGsVU20EXN2wcsHoReJuJJ0XfAVXbdkLlFupuABXVqHGu
 jd0VcB1p4gSRIpfl18m7I5bw/HVILqal4kLI7npc5mrVwGOpw/B8P3HDRnVKEAeTtM4loIKSfGfS
 uBgjc9H16GM95fCAsPgbYiEGWRRJX5CCNm2BxAlmAjeuir0qzLhq0BRO91mwTi2D6INeC95OiU/n
 I0kagyzaInYM/CnD8K5UIVeQyVn/taydaNjrw1THMkVfxzDO5nmYc3OWAikwAtSeGidmXCYn/6DL
 uKIReuw1Iv9bNPKUx9Rya9fvMk/equbsebS5l0Rvy1zVcaOzkBPf45R4sxlmAzJ3mndd9M2G8UyY
 470Ch9UnwI7OXBFRZrpc+wXu12kUXqtNazHb2D7BoL/dlwSzWtA/+o4fz8DqJZpisd7zED0yg5yx
 54Ywr4nKB8tVu9V3SwgFS7MaKdL7P4JmPg8S3+goUu/bJom6I+PiviJxNzMxFzAfNnTooEfwiRno
 yaUpEtGelmDznC95nZYnsHD1TQxoDgWPLI1OkU8AO7bcqSUnIMa7C6GB4zhimzed/uiL4wInWQvC
 JqsML0mv6f6htaA3tCIEOlI+mu/ucVinF85nNJobmVUVe1e6p+q++qkzrtlW3oZIHdCNylaIC25g
 ct0J8TTWg0ujX7S83T4uc/Yg0zFh+0qFWVe/ukPQBfVn8blD5/VHPcJm/OnTpTO/UZICgMDLr0oS
 K3zDZM5OqIvEwHsJEbRJRndGKzShRoSxMqY3/3Kf6VHbv54j84pYcOUjkl9ev3
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com
Date: Tue, 29 Aug 2023 08:47:35 +0800
X-OQ-MSGID: <20230829004735.99516-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <ZOynCqBv/JJyZ2Kj@krava>
References: <ZOynCqBv/JJyZ2Kj@krava>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 30 Aug 2023 07:15:47 +0000
Cc: yonghong.song@linux.dev, chantr4@gmail.com, ast@kernel.org, song@kernel.org,
 laoar.shao@gmail.com, rongtao@cestc.cn, linux-kselftest@vger.kernel.org,
 deso@posteo.net, rtoax@foxmail.com, xukuohai@huawei.com, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com, iii@linux.ibm.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
 zwisler@google.com, kpsingh@kernel.org, linux-arm-kernel@lists.infradead.org,
 haoluo@google.com, linux-kernel@vger.kernel.org, eddyz87@gmail.com,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, martin.lau@linux.dev,
 sdf@google.com
Subject: Re: [Linux-stm32] [PATCH bpf-next v8] selftests/bpf:
	trace_helpers.c: optimize kallsyms cache
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

> > Hi, jirka. Thanks for your reply.
> > 
> > > > @@ -164,13 +165,14 @@ int main(int argc, char **argv)
> > > >  	}
> > > >  
> > > >  	/* initialize kernel symbol translation */
> > > > -	if (load_kallsyms()) {
> > > > +	ksyms = load_kallsyms();
> > > 
> > > if we keep the load_kallsyms/ksym_search/ksym_get_addr functions as described
> > > in [1] the samples/bpf would stay untouched apart from the Makefile change
> > 
> > Maybe we should make this modification, wouldn't it be better? After all,
> > not modifying the source code of samples/bpf is not really a reason not to
> > make modifications to load_kallsyms(), what do you think?
> 
> I think we want separate selftest and samples changes and I don't see
> other way to do that

Thanks, jirka, I didn't notice this in the previous discussion, sorry.
Let me try to solve this problem.

Rong Tao

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
