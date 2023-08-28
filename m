Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFEC78B3A9
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 16:52:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 607EDC6B477;
	Mon, 28 Aug 2023 14:52:15 +0000 (UTC)
Received: from out203-205-251-27.mail.qq.com (out203-205-251-27.mail.qq.com
 [203.205.251.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DEFAC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 00:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693184248;
 bh=07E42jfJQmCYXrnwZwnudcFlZim/qk0Ysk33UK2jbQk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fL/mIX1kRAlxq1knGIA1Myqrp1HJZ8diHc0UorfeWDqdAduAWbFEeHCW/GdLWHz/v
 rgi2BnC6lAES+VGcTAYmxkixjaF3aAcA860QfwnfROhWFY/PmWiZ02Jp0hOfOz5APc
 UsJciyKqtuGqAXcKiOB8w0t6mIb6kYDcb1eH20VI=
Received: from localhost.localdomain ([39.156.73.12])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id E55B5432; Mon, 28 Aug 2023 08:57:21 +0800
X-QQ-mid: xmsmtpt1693184241tvvqacq7z
Message-ID: <tencent_D53295A257B55119C425836EA19E2CE84B07@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIeyPzr2ei58d3ax5qF6ia9HTfgB1ogL+NgC+2F1c0sTf+TUN2fsk
 fg1fEJmW9Tuy8muJvbOPcqGJP9eBhU03+eF9Bm8TQUYwDWsE254ZOl642pS83DaJ67eF8AaaduLV
 cJ+o8/erGoiVhhZAcVUVrPtYiIL7sRfDRPd0ua3p1XiZoyVqJd07BX47ChomrwE1srPDEGyo8WC5
 fIne6xErB2ZRs+iwRE0tTU/yzTsBRxaOND8G+MFrIToYfHBtp1KK34B8VDCdkblSP6rPcwEsGsau
 ZkZDNdoB8iXClFsSP94I/jxVTy2nkCDXmqd0+KjDseu8caDae5kc2NKa0dUb+emunAzol9N/datx
 DKQp6RLODadFAtqWs+5e4vD4DEAkZA6szwLxCTWjcENnhzDP6t+fdp2C+5xLLTlhhcsAZrcvuJZS
 PEc3gu83mn33yrzArOZkEl9KmH9Sd9eyR9+Ou4Nu7FfHECgDyoFHSlAEcEJswIUi7rYCtP3RikbH
 XYDsJybob33EnHoGhrCX169YwXiCJVzM6Z++oBHRm3TI5BaUaqPtPaIkOo+v8oGLsw00nFhb/q52
 u5xOwR4N3rUqkCXFmlMETO137Tz5hfCMzgY/3XLtE5rL3s2qGSZ4XVVxTIT8FaR0nKwuL7JjaYEf
 JVRmpa99PwwLitm8EBMfOPo7rv7IFtOg/0v6QolNAnKcfFwdB4ctuzKro+LDoS0WJcqJ0H7zKm71
 cK9x/mIV3N9sj6A5jO8P4oSZCa8bZkIt4cWocxT9bV1o18b3Sc9ChNPgLnQPE5DohW/DtLN2sjIs
 WQu3QfVyaPMgqy4nxXzAcoxShTxX+Qpoda/QjQ8v4A2pmYkBccPPW1Mqtvi+EJb/DGT1JRfP+CBR
 wNT9VxMO8hpegeC1kTPZ7XX1WGZDeMVNZOOwsT8v9t5Fug0XKHX1d573v9ptTlk5BU9fFwKL4NPj
 gYHWtSBbDXEM0XBTyHTG8v6/2ASilQghzu55cA2TcTji4QcDoJtd9HDsTGsGBx
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com
Date: Mon, 28 Aug 2023 08:57:21 +0800
X-OQ-MSGID: <20230828005721.26710-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <ZOsZwQptH05Gn9yU@krava>
References: <ZOsZwQptH05Gn9yU@krava>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Aug 2023 14:52:13 +0000
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

Hi, jirka. Thanks for your reply.

> > @@ -164,13 +165,14 @@ int main(int argc, char **argv)
> >  	}
> >  
> >  	/* initialize kernel symbol translation */
> > -	if (load_kallsyms()) {
> > +	ksyms = load_kallsyms();
> 
> if we keep the load_kallsyms/ksym_search/ksym_get_addr functions as described
> in [1] the samples/bpf would stay untouched apart from the Makefile change

Maybe we should make this modification, wouldn't it be better? After all,
not modifying the source code of samples/bpf is not really a reason not to
make modifications to load_kallsyms(), what do you think?

In addition, if we continue to keep the original ksym_search() interface,
the following problems are very difficult to deal with:

	Source code ksym_search [1]

    struct ksym *ksym_search(long key)
    {
    	int start = 0, end = sym_cnt;
    	int result;
    
    	/* kallsyms not loaded. return NULL */
    	if (sym_cnt <= 0)
    		return NULL;
    
    	while (start < end) {
    		size_t mid = start + (end - start) / 2;
    
    		result = key - syms[mid].addr;
    		if (result < 0)
    			end = mid;
    		else if (result > 0)
    			start = mid + 1;
    		else
    			return &syms[mid];                         <<<
    	}
    
    	if (start >= 1 && syms[start - 1].addr < key &&
    	    key < syms[start].addr)
    		/* valid ksym */
    		return &syms[start - 1];                       <<<
    
    	/* out of range. return _stext */
    	return &syms[0];                                   <<<
    }

The original ksym_search() interface directly returns the global syms 
address, which is also dangerous for multi-threading. If we allocate new
memory for this, it is not a perfect solution.

If we rewrite

	struct ksym *ksym_search(long key)

to
	struct ksym ksym_search(long key)

This also affects the source code in samples/bpf.

The same problem exists with ksym_get_addr().

Best wishes,
Rong Tao

[1] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/tools/testing/selftests/bpf/trace_helpers.c#n100

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
